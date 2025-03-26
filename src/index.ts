import { transformWithEsbuild, type Plugin } from 'vite';
import { spglslAngleCompile, SpglslAngleCompileInput, SpglslLanguage } from 'spglsl';
import { createFilter } from '@rollup/pluginutils';

interface Options {
  extensionMap: Map<string, string>,
  exclude?: string | string[],
  spglslInput: SpglslAngleCompileInput,
}


const DEFAULT_EXTENSION_MAP = new Map<string, SpglslLanguage>([
  [".frag", "Fragment"],
  [".vert", "Vertex"],
]);

export default function vitePluginSpglsl(options: Options): Plugin {
  let sourcemap: any = false;
  if (!options.extensionMap) {
    options.extensionMap = DEFAULT_EXTENSION_MAP;
  }

  const include = options.extensionMap.keys().toArray().map((ext) => "**/*" + ext);
  const filter = createFilter(include, options.exclude);
  const prod = process.env.NODE_ENV === 'production';


  function getFileExtensionWithDot(filename: string): string {
    const lastDot = filename.lastIndexOf('.');
    return lastDot === -1 ? '' : filename.slice(lastDot);
  }


  return {
    enforce: "pre",
    name: 'vite-plugin-spglsl',

    configResolved(resolvedConfig) {
      sourcemap = resolvedConfig.build.sourcemap;
    },
    async transform(code: string, id: string) {
      if (!filter(id)) return;

      try {
        options.spglslInput.mainSourceCode = code;
        const extension = getFileExtensionWithDot(id);
        options.spglslInput.language = options.extensionMap.get(extension);

        const result = await spglslAngleCompile(options.spglslInput);
        if (!result || !result.output) throw new Error("SPGLSL returned nothing!", {
          cause: options.spglslInput
        });
        if (!result.valid) throw new Error("Invalid GLSL code!", {
          cause: options.spglslInput,
        });

        if (!prod) {
          this.addWatchFile(id);
        }
        return await transformWithEsbuild(result.output, id, {
          sourcemap: sourcemap ? sourcemap : "external",
          loader: 'text', format: 'esm',
          minifyWhitespace: prod
        });
      } catch (error) {
        this.error(`Failed to process shader ${id}: ${error}`);
      }
    },
  };
}

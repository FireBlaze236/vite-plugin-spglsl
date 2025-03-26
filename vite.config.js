import { defineConfig } from 'vite';
// import viteSpglsl from "vite-plugin-spglsl";
import viteSpglsl from "./src/index.ts";

export default defineConfig({
  plugins: [viteSpglsl({
    spglslInput: {
      compileMode: "Optimize",
      minify: false,
      mangle: true
    },
    extensionMap: new Map([
      [".vert", "Vertex"],
      [".frag", "Fragment"]
    ])
  })]
});

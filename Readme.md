# vite-plugin-spglsl

A Vite plugin that integrates [SPIRV-GLSL-Compiler (spglsl)](https://github.com/SalvatorePreviti/spglsl/) for processing GLSL shaders with ANGLE compiler.

## Features

- Compiles GLSL shaders using Google's ANGLE compiler
- Supports both fragment and vertex shaders
- Source map generation
- Watch mode for development
- Minification in production builds
- Customizable compilation options

## Installation

```bash
npm install vite-plugin-spglsl --save-dev
# or
yarn add vite-plugin-spglsl -D
# or
pnpm add vite-plugin-spglsl -D
```

## Example configuration

```js
import { defineConfig } from 'vite';
 import viteSpglsl from "vite-plugin-spglsl";

export default defineConfig({
  plugins: [viteSpglsl({
    // Custom file extensions mapping (default shown)
    extensionMap: new Map([
      ['.frag', 'Fragment'],
      ['.vert', 'Vertex'],
      // Add more extensions as needed
    ]),

    // Files to exclude
    exclude: ['**/exclude-me.frag'],

    // SPGLSL compiler options
    spglslInput: {
      language: 'Fragment', // default for extension
      compileMode: 'Optimize',
      mangle: 'Optimize',
      minify: true,
      // See SPGLSL docs for more options
    } 
  })]
});
```

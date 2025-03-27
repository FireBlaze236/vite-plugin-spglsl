import shader from './shader.vert'
console.log('Processed shader:')
console.log(shader)

import shader_include from "./shader_include.vert"
console.log('Processed shader:')
console.log(shader_include);

document.body.innerHTML = `<pre>${shader}</pre> <pre>${shader_include}</pre>`

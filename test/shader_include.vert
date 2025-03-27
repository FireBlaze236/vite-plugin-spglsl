#version 300 es
precision highp float;
in vec4 a_pos;
uniform mat4 u_matrix;
uniform vec2 u_radarCenter;
uniform vec2 u_dataSize;

uniform vec2 u_radarRes;
uniform float u_elevation;
uniform float u_heightMul;

out vec2 texUV;

#include ./latlng.glsl

void main() {
    vec2 p = latLngToMerc(a_pos.xy);
    vec2 center = latLngToMerc(u_radarCenter);

    float a = a_pos.w;
    texUV = vec2(a_pos.z, a);

    float d = length(p - center);
    float h = d * tan(radians(u_elevation));

    gl_Position = u_matrix * vec4(p, h * u_heightMul, 1.0);
}


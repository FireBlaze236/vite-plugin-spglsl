precision highp float;
#define PI 3.1415926535897

attribute vec2 a_position;

uniform mat4 u_matrix;
uniform vec2 p[81];
uniform float lngRepeat;

varying vec2 tex;

void lagrange(float t, inout float f[9]) {
    f[0] = ((t - 0.125) / -0.125) * ((t - 0.25) / -0.25) * ((t - 0.375) / -0.375) * ((t - 0.5) / -0.5) *
        ((t - 0.625) / -0.625) * ((t - 0.75) / -0.75) * ((t - 0.875) / -0.875) * ((t - 1.0) / -1.0);
    f[1] = ((t - 0.0) / 0.125) * ((t - 0.25) / -0.125) * ((t - 0.375) / -0.25) * ((t - 0.5) / -0.375) *
        ((t - 0.625) / -0.5) * ((t - 0.75) / -0.625) * ((t - 0.875) / -0.75) * ((t - 1.0) / -0.875);
    f[2] = ((t - 0.0) / 0.25) * ((t - 0.125) / 0.125) * ((t - 0.375) / -0.125) * ((t - 0.5) / -0.25) *
        ((t - 0.625) / -0.375) * ((t - 0.75) / -0.5) * ((t - 0.875) / -0.625) * ((t - 1.0) / -0.75);
    f[3] = ((t - 0.0) / 0.375) * ((t - 0.125) / 0.25) * ((t - 0.25) / 0.125) * ((t - 0.5) / -0.125) *
        ((t - 0.625) / -0.25) * ((t - 0.75) / -0.375) * ((t - 0.875) / -0.5) * ((t - 1.0) / -0.625);
    f[4] = ((t - 0.0) / 0.5) * ((t - 0.125) / 0.375) * ((t - 0.25) / 0.25) * ((t - 0.375) / 0.125) *
        ((t - 0.625) / -0.125) * ((t - 0.75) / -0.25) * ((t - 0.875) / -0.375) * ((t - 1.0) / -0.5);
    f[5] = ((t - 0.0) / 0.625) * ((t - 0.125) / 0.5) * ((t - 0.25) / 0.375) * ((t - 0.375) / 0.25) *
        ((t - 0.5) / 0.125) * ((t - 0.75) / -0.125) * ((t - 0.875) / -0.25) * ((t - 1.0) / -0.375);
    f[6] = ((t - 0.0) / 0.75) * ((t - 0.125) / 0.625) * ((t - 0.25) / 0.5) * ((t - 0.375) / 0.375) *
        ((t - 0.5) / 0.25) * ((t - 0.625) / 0.125) * ((t - 0.875) / -0.125) * ((t - 1.0) / -0.25);
    f[7] = ((t - 0.0) / 0.875) * ((t - 0.125) / 0.75) * ((t - 0.25) / 0.625) * ((t - 0.375) / 0.5) *
        ((t - 0.5) / 0.375) * ((t - 0.625) / 0.25) * ((t - 0.75) / 0.125) * ((t - 1.0) / -0.125);
    f[8] = ((t - 0.0) / 1.0) * ((t - 0.125) / 0.875) * ((t - 0.25) / 0.75) * ((t - 0.375) / 0.625) *
        ((t - 0.5) / 0.5) * ((t - 0.625) / 0.375) * ((t - 0.75) / 0.25) * ((t - 0.875) / 0.125);
}

void main () {
    float f[9];

    tex = a_position;

    lagrange(a_position.y, f);
    vec2 a = p[0] * f[0] + p[1] * f[1] + p[2] * f[2] + p[3] * f[3] + p[4] * f[4] + p[5] * f[5] + p[6] * f[6] + p[7] * f[7] + p[8] * f[8];
    vec2 b = p[9] * f[0] + p[10] * f[1] + p[11] * f[2] + p[12] * f[3] + p[13] * f[4] + p[14] * f[5] + p[15] * f[6] + p[16] * f[7] + p[17] * f[8];
    vec2 c = p[18] * f[0] + p[19] * f[1] + p[20] * f[2] + p[21] * f[3] + p[22] * f[4] + p[23] * f[5] + p[24] * f[6] + p[25] * f[7] + p[26] * f[8];
    vec2 d = p[27] * f[0] + p[28] * f[1] + p[29] * f[2] + p[30] * f[3] + p[31] * f[4] + p[32] * f[5] + p[33] * f[6] + p[34] * f[7] + p[35] * f[8];
    vec2 e = p[36] * f[0] + p[37] * f[1] + p[38] * f[2] + p[39] * f[3] + p[40] * f[4] + p[41] * f[5] + p[42] * f[6] + p[43] * f[7] + p[44] * f[8];
    vec2 g = p[45] * f[0] + p[46] * f[1] + p[47] * f[2] + p[48] * f[3] + p[49] * f[4] + p[50] * f[5] + p[51] * f[6] + p[52] * f[7] + p[53] * f[8];
    vec2 h = p[54] * f[0] + p[55] * f[1] + p[56] * f[2] + p[57] * f[3] + p[58] * f[4] + p[59] * f[5] + p[60] * f[6] + p[61] * f[7] + p[62] * f[8];
    vec2 i = p[63] * f[0] + p[64] * f[1] + p[65] * f[2] + p[66] * f[3] + p[67] * f[4] + p[68] * f[5] + p[69] * f[6] + p[70] * f[7] + p[71] * f[8];
    vec2 j = p[72] * f[0] + p[73] * f[1] + p[74] * f[2] + p[75] * f[3] + p[76] * f[4] + p[77] * f[5] + p[78] * f[6] + p[79] * f[7] + p[80] * f[8];

    lagrange(a_position.x, f);

    vec2 position = a * f[0] + b * f[1] + c * f[2] + d * f[3] + e * f[4] + g * f[5] + h * f[6] + i * f[7] + j * f[8];
    float lng = lngRepeat + 180.0 + position.x;
    float lat = 180.0 - (180.0 / PI * log(tan(PI / 4.0 + position.y * PI / 360.0)));
    gl_Position = u_matrix * vec4(lng / 360.0, lat / 360.0, 0.0, 1.0);
}

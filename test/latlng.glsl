const float PI = 3.1415926538;

vec2 latLngToMerc(in vec2 pos) {
  float x = (180.0 + pos.x) / 360.0;
  float y = (180.0 - (180.0 / PI * log(tan(PI / 4.0 + pos.y * PI / 360.0)))) / 360.0;

  return vec2(x, y);
}

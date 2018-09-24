
class Rect {
  float x;
  float y;
  float dy;
  float r;
  Rect(float myX, float myY, float myR) {
    x=myX;
    y=myY;
    r=myR;
  }  
  void draw() {
    fill(#3CD9E5);
    stroke(0);
    rect(x, y, r, r);
  }
  void move() {
    x += dx;
  }  
  void reset() {
    if (x<0) {
      x = 500;
      dx=0;
    }
  }
}
/**
* Class representing a 'ice block'.
*/
class IceBlock {
  float x, y;
  float dy;
  float r;
  /**
  *Constructor for the 'ice block'.
  */
  IceBlock(float myX, float myY, float myR) {
    x=myX;
    y=myY;
    r=myR;
  }
  /**
  *Draws the 'ice block' on the screen.
  */
  void draw() {
    fill(#3CD9E5);
    stroke(0);
    rect(x, y, r, r);
  }
  /**
  *Moves the 'ice block' by the dx amount.
  */
  void move() {
    x += dx;
  }
  /**
  * Resets the 'ice block' to its
  * initial postion if the 'ice block'
  * goes off the screen.
  */
  void reset() {
    if (x<0) {
      x = 500;
      dx=0;
    }
  }
}
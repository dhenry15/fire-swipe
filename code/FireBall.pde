/**
* Class representing a 'fire ball'.
*/
class FireBall {
  float x2, y2;
  float diameter; 
  float dy;
  color hue;
  /**
  * Constructor for the 'fire ball'.
  */
  FireBall(float myX2, float myY2) {
    x2=myX2;
    y2=myY2;
    diameter=75;// CHange this part

    dy = 5; 
    hue=color(random(255), random(255), random(255));
  }
  /**
  * Draws the 'fire ball' on the screen
  */
  void draw() {
    fill(hue);
    y2=y2%height;
    ellipse(x2, y2, diameter, diameter); 
    image(Fireball,x2-diameter/2,y2-diameter/2);
    y2 += dy;
  }
  /**
  * Determines how fast the 'fire ball' moves.
  */
  void speed() {
    dy= 5+score/8;
  }
}
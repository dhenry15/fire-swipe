float mx0, mx1, mx, dx;
int hit, score, lives, textscore;

PFont myFont;
PImage Fireball;

Table table;
int highscore;

Rect rect;
Ball[] ball;

void setup() {
  size(750, 600);
  loadData(); 
  highscore=0;
  
  Fireball = loadImage("Fireball2.JPG");

  rectMode(CENTER);
  ball = new Ball[4];  //more balls makes less gap, thus harder.
  score = 0;
  dx = 0;
  lives = 3;

  rect = new Rect(500, 2*height/3, 25);

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(250, height/(2*ball.length)+i*height/ball.length);//bigger diameter (3rd argument)  makes less gap, thus harder.
  }


  println("gap btw balls = "+ (height/ball.length-ball[0].diameter/2) );
  //smaller gap -> harder. 
}

void draw() {
  background(0);
  
  highscore();
  
  textscore = score - 1; 
  fill(255);
  if (score==0) {
    myFont = loadFont("gameplayFont.vlw");
    textFont(myFont);
    textSize(18);
    text("Everytime you score past the balls, the balls will speed up.", 50, 60);
    text("Can you reach fifty?", 50, 90);
    text("Swipe left to start.", 50, 120);
  } else {
    textSize(20);
    text("lives: "+lives, 50, 50);
    text("score: "+textscore, 50, 80);
    stroke(255);
    line(45, 30, 45, 85);
    line(45, 85, 140, 85);
    line(140, 85, 140, 30);
    line(45, 30, 140, 30);
  }
  rect.draw();
  rect.move();
 // rect.reset();

  if (rect.x<0) {
    rect.reset();
    score += 1;
    println("score:",score -1);
  }

  for (int i = 0; i < ball.length && score != 0; i ++) {
    ball[i].draw();
    ball[i].speed();

    if (abs(ball[i].x2-rect.x)< rect.r && abs(ball[i].y2-rect.y)< rect.r) {
      dx = 0;
      rect.x = 500;
      lives -= 1;
      println("lives:",lives);
    }
  }
  if (lives == 0) { 
    background(255, 0, 0);
    dx = 0;
    myFont = loadFont("gameoverFont.vlw");
    textFont(myFont);
    fill(0);
    textSize(110);
    text("Game Over", 120, 200);
    textSize(90);
    text("Score:" +textscore, 205, 320);
    textSize(90);
    text("Highscore:" + highscore, 125,400);
    textSize(60);
    text("Swipe Right To Restart", 90, 550);
    if (mx > 0) { 
      score = 0;
      lives = 3;
    }
  }
  if (textscore == 50) {
    background(255, 0, 0);
    dx = 0;
    myFont = loadFont("winFont.vlw");
    textFont(myFont);
    textSize(110);
    fill(0);
    text("You Win!", 210, 320);
    textSize(60);
    text("Swipe Right To Restart", 120, 550);
    if (mx > 0) { 
      score = 0;
      lives = 3;
    }
  }
}

void mousePressed() { 
  mx0=mouseX;
}
void mouseReleased() {
  mx1=mouseX;
  mx = mx1-mx0;
  if (mx>0) {
    println("right swipe");
  } else if (mx<0) {
    println("left swipe");
    dx += -8; 
  }
}

void loadData(){
  table = loadTable("highscore.csv", "header"); 
  TableRow row = table.getRow(0);
  highscore = row.getInt("highscore");
  println("highscore:", highscore);
}

void highscore(){
 if(textscore > highscore){
  table.removeRow(0);
  TableRow row = table.addRow();
  row.setInt("highscore", textscore);
  saveTable(table,"data/highscore.csv");
  loadData();
 }
}
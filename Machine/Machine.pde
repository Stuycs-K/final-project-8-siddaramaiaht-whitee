import java.util.*;

static int PLAYING = 0;
static int OVER = 1;
static int MODE = PLAYING;

static int highScore = 0;

Ball b;
ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Bell> bells = new ArrayList<Bell>();
ArrayList<Bumper> bumpers = new ArrayList<Bumper>();

Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

final int leftX = 275;
final int leftY = 645;
final int rightX = 800 - leftX;
final int rightY = leftY;

final int wi = 20; //width of flippers
final int len = 100; //length of flippers

Flipper left = new Flipper(0, leftX, leftY, len, wi, 2, 0);
Flipper right = new Flipper(1, rightX, rightY, len, wi, 2, 0);

boolean upPressedLastFrame = false;
boolean upLetGo = false;
boolean downPressedLastFrame = false;
boolean downLetGo = false;
final float strengthIncrement = 1;

final int wallWi = 20;
final int sideGap = 100;
final int midGap = 220;

int scoreCountdown = 0;
final int scoreTimer = 10;

void setup(){
  size(800, 800);
  //frameRate(20);
  
  scoreCountdown = 0;
  
  left.display();
  right.display();
  
  b = new Ball(new PVector(640, 150), new PVector(0, 0), new PVector(0, 0));
  /*b = new Ball(new PVector(400, 400), new PVector(0, 0), new PVector(0, 0)); /************TEST************/
  
  walls.add(new Wall(width - sideGap - wallWi, sideGap, wallWi, height - 200, 0));
  walls.add(new Wall(sideGap, sideGap, wallWi, height - 200, 0));
  walls.add(new Wall(sideGap, sideGap, width - 200, wallWi, 0));
  walls.add(new Wall(sideGap, height - sideGap - wallWi+20, (width - 2 * sideGap - midGap) / 2+40, wallWi, 0));
  walls.add(new Wall(sideGap + (width - 2 * sideGap - midGap) / 2 + midGap-40, height - sideGap - wallWi+20, (width - 2 * sideGap - midGap) / 2+40, wallWi, 0));
  
  walls.add(new Wall(width - sideGap - wallWi-100, sideGap+20, wallWi, height - 600, 0));

  //walls.add(new Wall(sideGap + (width - 2 * sideGap - midGap) / 2 + midGap-500, height - sideGap - wallWi-100, (width - 2 * sideGap - midGap) / 2+500, wallWi, 0));

  //walls.add(new Wall(450, 450, 100, 100, 20));
  bumpers.add(new Bumper(100, 400, 100, 700, 330, 700, 0.5, 0));
  bumpers.add(new Bumper(700, 400, 470, 700, 700, 700, 0.5, 0));
  bumpers.add(new Bumper(100, 400, 100, 100, 330, 100, 0.5, 0));
  //bumpers.add(new Bumper(700, 400, 470, 700, 700, 700, 0.5, 0));

  /*for(int i = 100; i < 300; i++){
    walls.add(new Wall(i, 350+i, 1, 350-i, 0));
    walls.add(new Wall(799-i, 350+i, 1, 350-i, 0));
  }*/
  //bumpers.add(
  
  int curScore = 50;
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 2; j++){
      bells.add(new Bell((int)(Math.random()*125)+225+j*200, (int)(Math.random()*125)+145+175*i, 50, curScore));
    }
    curScore -= 20;
  }  
  
  
  /************TEST************/
  //bells.add(new Bell(400, 500, 50, 30));
  /************TEST************/
  
  keyboardInput = new Controller();
}

void draw(){
  if (scoreCountdown > 0){
    scoreCountdown--;
  }
  if (keyboardInput.isPressed(Controller.RESTART) && MODE == OVER){
    walls.clear();
    bells.clear();
    bumpers.clear();
    setup();
    MODE = PLAYING;
  }
  if(MODE == 1){
    fill(255, 0, 0);
    textSize(60);
    text("GAME OVER", 270, 400);
    textSize(30);
    text("Press 'q' to play again.",280, 470);
    text("Press 'r' to play again with a different layout.", 130, 500);
    b.getPos().set(640, 150);
    b.getV().set(0, 0);
    b.getAcc().set(0, 0);
    b.score = 0;
  }
  else{
    background(255);
    left.display();
    right.display();
    for(int i = 0; i < walls.size(); i++){
      walls.get(i).display();
      if(walls.get(i).bounce(b) && scoreCountdown == 0){
        b.addScore(walls.get(i).getScore());
        scoreCountdown = scoreTimer;
      }
    }
    for(int i = 0; i < bells.size(); i++){
      bells.get(i).display();
      if(bells.get(i).bounce(b) && scoreCountdown == 0){
        b.addScore(bells.get(i).getScore());
        scoreCountdown = scoreTimer;
      }
    }
    for(int i = 0; i < bumpers.size(); i++){
      bumpers.get(i).display();
      if(bumpers.get(i).bounce(b) && scoreCountdown == 0){
        b.addScore(bumpers.get(i).getScore());
        scoreCountdown = scoreTimer;
      }
    }
    if(left.bounce(b) && scoreCountdown == 0){
      b.addScore(left.getScore());
      scoreCountdown = scoreTimer;
      //System.out.println("left bounce");
    }
    if(right.bounce(b) && scoreCountdown == 0){    
      b.addScore(right.getScore());
      scoreCountdown = scoreTimer;
      //System.out.println("right bounce");
    }
    //System.out.println(left.getBounciness());
    
    b.display();
    
    /************TEST************/
    PVector ballNextPos = PVector.add(b.getPos(), b.getV());
    fill(0);
    stroke(0);
    circle(ballNextPos.x , ballNextPos.y, 10);
    
    System.out.println("ball position: <" + b.position.x + ", " + b.position.y + ">");
    /************TEST************/
    
    if (highScore < b.getScore()){
      highScore = b.getScore();
    }
    
    b.move();
    b.applyForce(new PVector(0, 9.8));
    fill(0);
    textSize(40);
    text("Score: " + b.getScore(), 20, 50);
    text("High Score: " + highScore, 260, 50);
    textSize(20);
    text("press 'q' to quit",650, 30);
  }
  
  if ((keyboardInput.isPressed(Controller.SWING) || left.getAngle() > left.getAngleI()) && MODE != 1){
    left.swing();
    right.swing();
  }
  
  if (upLetGo){
    left.changeStrength(strengthIncrement);
    right.changeStrength(strengthIncrement);
    upLetGo = false;
  }
  if (upPressedLastFrame && ! keyboardInput.isPressed(Controller.INCREASE)){
    upLetGo = true;
    upPressedLastFrame = false;
  }
  if (keyboardInput.isPressed(Controller.INCREASE)){
    upPressedLastFrame = true;
  }
  
  if (downLetGo){
    left.changeStrength(-1 * strengthIncrement);
    right.changeStrength(-1 * strengthIncrement);
    downLetGo = false;
  }
  if (downPressedLastFrame && ! keyboardInput.isPressed(Controller.DECREASE)){
    downLetGo = true;
    downPressedLastFrame = false;
  }
  if (keyboardInput.isPressed(Controller.DECREASE)){
    downPressedLastFrame = true;
  }
  
  left.strengthDisplay();
  
  left.updateHitbox();
  right.updateHitbox();
  
  //stroke(0);
  //fill(0);
  //rect(200, 450, 10, 10);
}

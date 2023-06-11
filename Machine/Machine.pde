import java.util.*;

static int PLAYING = 0;
static int OVER = 1;
static int MODE = PLAYING;

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

void setup(){
  size(800, 800);
  frameRate(20);
  
  left.display();
  right.display();
  
  b = new Ball(new PVector(400, 401), new PVector(0, 0), new PVector(0, 0));
  
 /* walls.add(new Wall(width - sideGap - wallWi, sideGap, wallWi, height - 200, 0));
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
  /*
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 2; j++){
      bells.add(new Bell((int)(Math.random()*125)+225+j*200, (int)(Math.random()*125)+145+175*i, 50, 30));
    }
  }  
  */
  
  /************TEST************/
  bells.add(new Bell(400, 500, 50, 30));
  /************TEST************/
  
  keyboardInput = new Controller();
}

void draw(){
  
  if(MODE == 1){
    fill(255, 0, 0);
    text("GAME OVER", 280, 400);
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
      if(walls.get(i).bounce(b)){
        b.addScore(walls.get(i).getScore());
      }
    }
    for(int i = 0; i < bells.size(); i++){
      bells.get(i).display();
      if(bells.get(i).bounce(b)){
        b.addScore(bells.get(i).getScore());
      }
    }
    for(int i = 0; i < bumpers.size(); i++){
      bumpers.get(i).display();
      if(bumpers.get(i).bounce(b)){
        b.addScore(bumpers.get(i).getScore());
      }
    }
    if(left.bounce(b)){
      b.addScore(left.getScore());
      //System.out.println("left bounce");
    }
    if(right.bounce(b)){
      b.addScore(right.getScore());
      //System.out.println("right bounce");
    }
    //System.out.println(left.getBounciness());
    
    b.display();
    
    /************TEST************/
    PVector ballNextPos = PVector.add(b.getPos(), b.getV());
    fill(0);
    stroke(0);
    circle(ballNextPos.x , ballNextPos.y, 10);
    /************TEST************/
    
    b.move();
    b.applyForce(new PVector(0, 9.8));
    fill(0);
    textSize(50);
    text("Score: " + b.getScore(), 20, 50);
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

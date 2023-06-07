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

final int leftX = 295;
final int leftY = 645;
final int rightX = 800 - leftX;
final int rightY = leftY;

final int wi = 20; //width of flippers
final int len = 100; //length of flippers

//Flipper left = new Flipper(0, leftX, leftY, new float[][] {{0,0},{0,0}}, 1, 0);
//Flipper right = new Flipper(1, rightX, rightY, new float[][] {{0,0},{0,0}}, 1, 0);

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
  
  /*left.display();
  right.display();*/
  
  b = new Ball(new PVector(400, 500), new PVector(0, 2), new PVector(0, 0));
  
  walls.add(new Wall(new float[][] {{100, 700},{500, 500}}, "above", 1, 0)); /*******TEST*********/
  
  /*walls.add(new Wall(width - sideGap - wallWi, sideGap, wallWi, height - 200, 0));
  walls.add(new Wall(sideGap, sideGap, wallWi, height - 200, 0));
  walls.add(new Wall(sideGap, sideGap, width - 200, wallWi, 0));
  walls.add(new Wall(sideGap, height - sideGap - wallWi, (width - 2 * sideGap - midGap) / 2, wallWi, 0));
  walls.add(new Wall(sideGap + (width - 2 * sideGap - midGap) / 2 + midGap, height - sideGap - wallWi, (width - 2 * sideGap - midGap) / 2, wallWi, 0));
  
  bumpers.add(new Bumper(350, 350, 1, 30));
  for(int i = 100; i < 300; i++){
    walls.add(new Wall(i, 350+i, 1, 350-i, 0));
    walls.add(new Wall(799-i, 350+i, 1, 350-i, 0));
  }
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 2; j++){
      bells.add(new Bell((int)(Math.random()*125)+145+i*200, (int)(Math.random()*125)+145+175*j, 50, 30));
    }
  }  */
  
  keyboardInput = new Controller();
  
  //walls.add(
}

void draw(){
  
  if(MODE == 1){
    fill(255, 0, 0);
    text("GAME OVER", 280, 400);
  }
  else{
    background(255);
    
    /*left.display();
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
    bumpers.get(0).display();
    if(bumpers.get(0).bounce(b)){
      b.addScore(bumpers.get(0).getScore());
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
    */
    b.display();
    b.applyForce(new PVector(0, 9.8));
    b.move();
    fill(0);
    textSize(50);
    text("Score: " + b.getScore(), 20, 50);
    
    /*******TEST*********/
    walls.get(0).display();
    if (walls.get(0).bounce(b)){
      b.addScore(walls.get(0).getScore());
    }
    
    /*******TEST*********/
  }
  /*
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
  */
  
  //stroke(0);
  //fill(0);
  //rect(200, 450, 10, 10);
}

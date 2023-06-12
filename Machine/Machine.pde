import java.util.*;

static int PLAYING = 0;
static int OVER = 1;
static int MULTI = 2;
static int MODE = PLAYING;
static int n = 1;
static int count = 0;

Ball b;
ArrayList<Ball> balls = new ArrayList<Ball>();
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

Flipper left = new Flipper(0, leftX, leftY, len, wi, 1.05, 0);
Flipper right = new Flipper(1, rightX, rightY, len, wi, 1.05, 0);

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
  //frameRate(10);
  
  left.display();
  right.display();
  
  b = new Ball(new PVector(640, 150), new PVector(0, 0), new PVector(0, 0), 50, 80);
  balls.add(b);
  for(int i = 1; i < 10; i++){
    int size = (int)(Math.random()*30+30);
    balls.add(new Ball(new PVector(640, 150), new PVector(0, 0), new PVector(0, 0), size, size+20));
  }
  
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
  bumpers.add(new Bumper(330, 100, width - sideGap - wallWi-100, sideGap+20, 470, 200, 0.5, 0));
  //bumpers.add(new Bumper(700, 400, 470, 700, 700, 700, 0.5, 0));

  /*for(int i = 100; i < 300; i++){
    walls.add(new Wall(i, 350+i, 1, 350-i, 0));
    walls.add(new Wall(799-i, 350+i, 1, 350-i, 0));
  }*/
  //bumpers.add(
  for(int i = 0; i < 2; i++){
    for(int j = 0; j < 2; j++){
      bells.add(new Bell((int)(Math.random()*125)+225+j*200, (int)(Math.random()*125)+245+175*i, 50, 30));
    }
  }  
  
  keyboardInput = new Controller();
}

void draw(){
  
  if(MODE == 1){
    fill(255, 0, 0);
    text("GAME OVER", 280, 400);
    for(int i = 0; i < balls.size(); i++){
      balls.get(i).getPos().set(640, 150);
      balls.get(i).getV().set(0, 0);
      balls.get(i).getAcc().set(0, 0);
      balls.get(i).score = 0;
    }
  }
  else{
    if(MODE == 2){
      if(count % 150 == 0 && n < balls.size()){
        n++;
      }
      count++;
    }
    else{
      n=1;
      count = 0;
    }
    background(255);
    left.display();
    right.display();
    for(int i = 0; i < walls.size(); i++){
      walls.get(i).display();
      for(int j = 0; j < balls.size(); j++){
        if(walls.get(i).bounce(balls.get(j))){
          b.addScore(walls.get(i).getScore());
        }
      }
    }
    for(int i = 0; i < bells.size(); i++){
      bells.get(i).display();
      for(int j = 0; j < balls.size(); j++){
        if(bells.get(i).bounce(balls.get(j))){
          balls.get(j).addScore(bells.get(i).getScore());
        }
      }
    }
    for(int i = 0; i < bumpers.size(); i++){
      bumpers.get(i).display();
      for(int j = 0; j < balls.size(); j++){
        if(bumpers.get(i).bounce(balls.get(j))){
          b.addScore(bumpers.get(i).getScore());
        }
      }
    }
    for(int j = 0; j < balls.size(); j++){
      if(left.bounce(balls.get(j))){
        b.addScore(left.getScore());
        //System.out.println("left bounce");
      }
    }
    for(int j = 0; j < balls.size(); j++){
      if(right.bounce(balls.get(j))){
        b.addScore(right.getScore());
        //System.out.println("right bounce");
      }
    }
    //System.out.println(left.getBounciness());
    /*b.display();
    b1.display();
    //b1.bounce(b);
    b1.bounce(b);
    b.move();
    b1.move();

    b.applyForce(new PVector(0, 9.8));
    b1.applyForce(new PVector(0, 9.8));*/
    for(int j = 0; j < n; j++){
      balls.get(j).display();
      balls.get(j).move();
      balls.get(j).applyForce(new PVector(0, 9.8));
      for(int i = j+1; i < n; i++){
        balls.get(j).bounce(balls.get(i));
      }
    }

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

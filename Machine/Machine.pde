import java.util.*;

static int PLAYING = 0;
static int OVER = 1;
static int MODE = PLAYING;

Ball b;
ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Bell> bells = new ArrayList<Bell>();
ArrayList<Bumper> bumpers = new ArrayList<Bumper>();

void setup(){
  size(800, 800);
  frameRate(100);
  
  b = new Ball(new PVector(410, 500), new PVector(0, 1), new PVector(0, 0));
  walls.add(new Wall(700, 100, 20, 600, 0));
  walls.add(new Wall(100, 100, 20, 600, 0));
  walls.add(new Wall(100, 100, 600, 20, 0));
  walls.add(new Wall(100, 700, 200, 20, 0));
  walls.add(new Wall(520, 700, 200, 20, 0));
  bumpers.add(new Bumper(350, 350, 1, 30));
  for(int i = 100; i < 300; i++){
    walls.add(new Wall(i, 350+i, 1, 350-i, 0));
    walls.add(new Wall(819-i, 350+i, 1, 350-i, 0));
  }
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 2; j++){
      bells.add(new Bell((int)(Math.random()*125)+145+i*200, (int)(Math.random()*125)+145+175*j, 50, 30));
    }
  }  
}

void draw(){
  if(MODE == 1){
    fill(255, 0, 0);
    text("GAME OVER", 280, 400);
  }
  else{
    background(255);
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
    b.display();
    b.applyForce(new PVector(0, 9.8));
    b.move();
    fill(0);
    textSize(50);
    text("Score: " + b.getScore(), 20, 50);
  }
}

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
  
  b = new Ball(new PVector(150, 150), new PVector(1, 1), new PVector(0, 0));
  walls.add(new Wall(700, 100, 20, 600, 0));
  walls.add(new Wall(100, 100, 20, 600, 0));
  walls.add(new Wall(100, 100, 600, 20, 0));
  walls.add(new Wall(100, 700, 250, 20, 0));
  walls.add(new Wall(470, 700, 250, 20, 0));
  bumpers.add(new Bumper(350, 350, 1, 30));
  for(int i = 100; i < 350; i++){
    stroke(0);
    walls.add(new Wall(i, 350+i, 1, 350-i, 0));
    walls.add(new Wall(820-i, 350+i, 1, 350-i, 0));
  }
  for(int i = 0; i < 6; i++){
    bells.add(new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 30));
  }
}

void draw(){
  if(MODE =
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

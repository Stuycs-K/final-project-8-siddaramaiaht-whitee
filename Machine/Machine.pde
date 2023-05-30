import java.util.*;

Ball b;
ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Bell> bells = new ArrayList<Bell>();
ArrayList<Bumper> bumpers = new ArrayList<Bumper>();

void setup(){
  size(800, 800);
  frameRate(100);
  
  b = new Ball(new PVector(150, 150), new PVector(1, 1), new PVector(0, 0));
  walls.add(new Wall(700, 100, 20, 600));
  walls.add(new Wall(100, 100, 20, 600));
  walls.add(new Wall(100, 100, 600, 20));
  walls.add(new Wall(100, 700, 250, 20));
  walls.add(new Wall(470, 700, 250, 20));
  bumpers.add(new Bumper(350, 350, 1));
  for(int i = 0; i < 6; i++){
    bells.add(new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20));
  }
}

void draw(){
  background(255);
  for(int i = 0; i < walls.size(); i++){
    walls.get(i).display();
    walls.get(i).bounce(b);
  }
  for(int i = 0; i < bells.size(); i++){
    bells.get(i).display();
    bells.get(i).bounce(b);
  }
  bumpers.get(0).display();
  bumpers.get(0).bounce(b);
  b.display();
  b.applyForce(new PVector(0, 9.8));
  b.move();
}

import java.util.*;

Ball b;
ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Bell> bells = new ArrayList<Bell>();

void setup(){
  size(800, 800);
  frameRate(100);
  
  b = new Ball(new PVector(500, 500), new PVector(-3, -5), new PVector(0, 0));
  walls.add(new Wall(700, 100, 20, 600));
  walls.add(new Wall(100, 100, 20, 600));
  walls.add(new Wall(100, 100, 600, 20));
  walls.add(new Wall(100, 700, 250, 20));
  walls.add(new Wall(470, 700, 250, 20));
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
  b.display();
  b.move();
}

Ball b0;
Wall edge1;
Wall edge2;
Wall edge3;
Wall edge4;
Wall edge5;
Bell be0;
Bell be1;
Bell be2;
Bell be3;
Bell be4;
Bell be5;

void setup(){
  size(800, 800);
  edge1 = new Wall(700, 100, 20, 600);
  edge2 = new Wall(100, 100, 20, 600);
  edge3 = new Wall(100, 100, 600, 20);
  edge4 = new Wall(100, 700, 250, 20);
  edge5 = new Wall(470, 700, 250, 20);
  be0 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be1 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be2 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be3 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be4 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be5 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  b0 = new Ball(new PVector(500, 500), new PVector(-3, -5), new PVector(0, 0));

}

void draw(){
  background(255);
  edge1.display();
  edge2.display();
  edge3.display();
  edge4.display();
  edge5.display();
  edge1.bounce(b0);
  edge2.bounce(b0);
  edge3.bounce(b0);
  edge4.bounce(b0);
  edge5.bounce(b0);
  be0.display();
  be1.display();
  be2.display();
  be3.display();
  be4.display();
  be5.display();
  b0.display();
  b0.move();
}

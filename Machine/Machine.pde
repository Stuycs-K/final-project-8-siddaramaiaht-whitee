void setup(){
  size(800, 800);
  Wall edge1 = new Wall(700, 100, 20, 600);
  edge1.display();
  Wall edge2 = new Wall(100, 100, 20, 600);
  edge2.display();
  Wall edge3 = new Wall(100, 100, 600, 20);
  edge3.display();
  Wall edge4 = new Wall(100, 700, 250, 20);
  edge4.display();
  Wall edge5 = new Wall(470, 700, 250, 20);
  edge5.display();
  Bell be0 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be0.display();
  Bell be1 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be1.display();
  Bell be2 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be2.display();
  Bell be3 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be3.display();
  Bell be4 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be4.display();
  Bell be5 = new Bell((int)(Math.random()*550)+150, (int)(Math.random()*550)+150, 50, 20);
  be5.display();
}

void draw(){
  
}

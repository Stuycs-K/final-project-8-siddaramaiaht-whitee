Flipper left = new Flipper(0);
Flipper right = new Flipper(1);

void setup(){
  size(600,600);
  left.display();
  right.display();
  //fill(255);
  //rect(200,200,100,100);
}

void draw(){
  background(190);
  left.swing();
  right.swing();
  left.display();
  right.display();
}

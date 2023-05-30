final int leftX = 100;
final int leftY = 300;
final int rightX = 500;
final int rightY = 300;

void setup(){
  size(600,600);
  //Flipper left = new Flipper(leftX, leftY, 1, 0, 0);
  Flipper right = new Flipper(rightX, rightY, 1, 20, 1);
  left.display();
  right.display();
  //fill(255);
  //rect(200,200,100,100);
}

void draw(){
  
}

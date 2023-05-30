Flipper left = new Flipper(0);
Flipper right = new Flipper(1);
final int SPACE = 49;

void setup(){
  size(600,600);
  left.display();
  right.display();
}

void draw(){
  background(190);
  left.swing();
  right.swing();
  left.display();
  right.display();
}

void swing(){
  
}

void keyPressed(){
  if (key == CODED){
    if (key == SPACE){
      left.swing();
      right.swing();
    }
  }   
}

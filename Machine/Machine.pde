Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

Flipper left = new Flipper(0);
Flipper right = new Flipper(1);

void setup(){
  size(600,600);
  keyboardInput = new Controller();
  left.display();
  right.display();
}

void draw(){
  background(190);
  if (keyboardInput.isPressed(Controller.SWING) || left.getAngle() < left.getAngleI()){
    left.swing();
    right.swing();
  }
  left.display();
  right.display();
}

void swing(){
  
}

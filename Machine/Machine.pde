Controller keyboardInput;
final float initialAngle = Flipper.initialAngle;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

Flipper left = new Flipper(0);
Flipper right = new Flipper(1);
final int SPACE = 49;

void setup(){
  size(600,600);
  keyboardInput = new Controller();
  left.display();
  right.display();
}

void draw(){
  background(190);
  if (keyboardInput.isPressed(Controller.SWING) || left.getAngle() > Flipper.initialAngle){
    left.swing();
    right.swing();
  }
  left.display();
  right.display();
}

void swing(){
  
}

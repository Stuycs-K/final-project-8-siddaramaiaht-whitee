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
  public boolean upPressedLastFrame = false;
  public boolean upLetGo = false;
  public boolean downPressedLastFrame = false;
  public boolean downLetGo = false;
  background(190);
  if (keyboardInput.isPressed(Controller.SWING) || left.getAngle() > left.getAngleI()){
    left.swing();
    right.swing();
  }
  if (upLetGo){
    left.changeStrength(1);
  }
  if (keyboardInput.isPressed(Controller.INCREASE)){
    
  }
  left.display();
  right.display();
}

void swing(){
  
}

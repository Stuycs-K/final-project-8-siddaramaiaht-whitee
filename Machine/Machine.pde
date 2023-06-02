Controller keyboardInput;

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

Flipper left = new Flipper(0);
Flipper right = new Flipper(1);

boolean upPressedLastFrame = false;
boolean upLetGo = false;
boolean downPressedLastFrame = false;
boolean downLetGo = false;
final float strengthIncrement = 1;

void setup(){
  size(600,600);
  keyboardInput = new Controller();
  left.display();
  right.display();
}

void draw(){
  background(190);
  
  if (keyboardInput.isPressed(Controller.SWING) || left.getAngle() > left.getAngleI()){
    left.swing();
    right.swing();
  }
  
  if (upLetGo){
    left.changeStrength(strengthIncrement);
    right.changeStrength(strengthIncrement);
    upLetGo = false;
    System.out.println("strength increased");
  }
  if (upPressedLastFrame && ! keyboardInput.isPressed(Controller.INCREASE)){
    upLetGo = true;
    upPressedLastFrame = false;
    System.out.println("up has been let go");
  }
  if (keyboardInput.isPressed(Controller.INCREASE)){
    upPressedLastFrame = true;
    System.out.println("up pressed");
  }
  
  if (downLetGo){
    left.changeStrength(-1 * strengthIncrement);
    right.changeStrength(-1 * strenghtIncrement);
    downLetGo = false;
    System.out.println("strength decreased");
  }
  if (downPressedLastFrame && ! keyboardInput.isPressed(Controller.DECREASE)){
    downLetGo = true;
    downPressedLastFrame = false;
    System.out.println("down has been let go");
  }
  if (keyboardInput.isPressed(Controller.DECREASE)){
    downPressedLastFrame = true;
    System.out.println("down pressed");
  }
  
  left.display();
  right.display();
}

void swing(){
  
}

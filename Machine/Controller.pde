class Controller {
  static final int SWING = 0;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[1];//2 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == ' ')
      inputs[SWING] = true;
  }
  
  void release(int code) {
    if(code == ' ')
    inputs[SWING] = false;
  }
}

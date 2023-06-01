class Controller {
  static final int SWING = 0;
  static final int INCREASE = 1;
  static final int DECREASE = 2;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[3];//3 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if (code == ' ')
      inputs[SWING] = true;
    if (code == 38)
      inputs[INCREASE] = true;
    if (code == 40)
      inputs[DECREASE] = true;
  }
  
  void release(int code) {
    if (code == ' ')
      inputs[SWING] = false;
    if (code == 38)
      inputs[INCREASE] = false;
    if (code == 40)
      inputs[DECREASE] = false;
  }
}

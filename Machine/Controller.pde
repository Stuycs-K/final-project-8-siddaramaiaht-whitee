class Controller {
  static final int SWING = 0;
  static final int INCREASE = 1;
  static final int DECREASE = 2;
  static final int RESTART = 3;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[4];//3 valid buttons
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
    if(code == 'Q')
      Machine.MODE = (Machine.MODE+1)%2;
    if(code == 'R')
      inputs[RESTART] = true;;
    if(code == 'M')
      Machine.MODE = MULTI;
  }
  
  void release(int code) {
    if (code == ' ')
      inputs[SWING] = false;
    if (code == 38)
      inputs[INCREASE] = false;
    if (code == 40)
      inputs[DECREASE] = false;
    if (code == 'R')
      inputs[RESTART] = false;
  }
}

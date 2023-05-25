class Flipper extends Stopper{
  final float flipperK = 1;
  final float w = 5;
  final float l = 15;
  private float swingSpeed; // speed of swing in degrees per frame
  final float swingSpeedInitial = 6;
  final float swingSweep; // angle that the flipper sweeps 
  private float force;
  private float angle; // angle to the inward horizontal at their current position
  public Flipper(int x, int y, float s, float theta){
    super(x, y, flipperK);
    angle = theta;
    swingSpeed = s;
  }
  
  public void setSwingSpeed(new newSpeed){
    swingSpeed = newSpeed;
  }
  
  public void swing(){
    setSwingSpeed(swingSpeedInitial);
    for (int count = 0; count < swingSweep / swingSpeed; count++){
      angle -= swingSpeed;
      // will need to change hitbox every time angle changes
    }
  }
  
  public void display(){
     // will use 2d array hitbox
  }
}

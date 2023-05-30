class Flipper extends Stopper{
  final float wi = 20;
  final float len = 60;
  final float swingSpeedInitial = 6;
  final float flipperMass = 10;
  final float swingSweep = 30; // angle that the flipper sweeps 
  private float swingSpeed; // speed of swing in degrees per frame
  private float angle; // angle to the inward horizontal at their current position
  private int side; // 0 for left, 1 for right
  public Flipper(int x, int y, float s, float theta, int si){
    super(x, y); // x and y are coords of center of rotation
    angle = theta;
    swingSpeed = s;
    side = si;
  }
  
  public void setSwingSpeed(float newSpeed){
    swingSpeed = newSpeed;
  }
  
  public void swing(){
    setSwingSpeed(swingSpeedInitial);
    for (int count = 0; count < swingSweep / swingSpeed; count++){
      angle -= swingSpeed;
      // will need to change hitbox every time angle changes using trig
    }
  }
  
  public void display(){
    float x = getPos().x;
    float y = getPos().y;
    stroke(0);
    fill(200, 10, 10);
    if (side == 0){
      pushMatrix();
      translate(x, y);
      rotate(-1 * radians(angle));
      rect(0, -1 * wi / 2, len, wi);
      popMatrix();
    }else{
      pushMatrix();
      translate(x, y);
      rotate(radians(angle));
      rect(0, -1 * wi / 2, len, wi);
      popMatrix();
    }
  }

}

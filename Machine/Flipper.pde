class Flipper extends Stopper{
  final float flipperK = 1;
  final float w = 5;
  final float l = 15;
  private float swingSpeed; // speed of swing in degrees per frame
  final float swingSweep; // angle that the flipper sweeps 
  private float force;
  final float swingForceInitial = 10;
  private float angle; // angle to the inward horizontal at their resting position
  public Flipper(int x, int y, float F, float s, float theta){
    super(x, y, flipperK);
    force = F;
    angle = theta;
    swingSpeed = s;
  }
 
  // will be used to change the force of the swing as it comes to a stop
  public void setForce(float newForce){
    force = newForce;
  }
  
  public void swing(){
    setForce(swingForceInitial);
    for (int count = 0; count < swingSweep / swingSpeed; count++){
      angle -= swingSpeed;
    }
  }
  
  
  public void display(){
     
  }
}

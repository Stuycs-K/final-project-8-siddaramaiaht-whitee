class Flipper extends Stopper{
  final float flipperK = 1;
  final float w = 5;
  final float l = 15;
  final float swingSpeed;
  final float swingSweep;
  private float force;
  private float angle; // angle to the inward horizontal at their resting position
  public Flipper(int x, int y, float F, float theta){
    super(x, y, flipperK);
    force = F;
    angle = theta;
  }
  
  public void swing(){
    for (int count = 0; count < swingSweep / swingSpeed; count++){
      angle -= swingSpeed;
    }
  }
  
  public void changeForce(){
    
  }
}

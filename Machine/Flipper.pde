class Flipper extends Stopper{
  final int wi = 20;
  final int len = 60;
  final float initialSwingSpeed = 1;
  final float flipperMass = 10;
  final float swingSweep = 65; // angle that the flipper sweeps 
  private float swingSpeed; // speed of swing in degrees per frame
  private float angle; // angle to the inward horizontal at their current position
  final float initialAngle = 60;
  private int side; // 0 for left, 1 for right
  
  final int leftX = 100;
  final int leftY = 300;
  final int rightX = width - leftX;
  final int rightY = leftY;
  
  public Flipper(int si){
    if (si == 0){
      pos = new PVector(leftX, leftY);
    }
    if (si == 1){
      pos = new PVector(rightX, rightY);
    }
    angle = initialAngle;
    swingSpeed = initialSwingSpeed;
    side = si;
  }
  
  public void swing(){
    if (angle >= initialAngle - swingSweep + swingSpeed){
      angle -= swingSpeed;
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
      rotate(radians(angle));
      rect(-1 * len, -1 * wi / 2, 2 * len, wi);
      popMatrix();
    }else{
      pushMatrix();
      translate(width - leftX, y);
      rotate(-1 * radians(angle));
      rect(-1 * len, -1 * wi / 2, 2 * len, wi);
      popMatrix();
    }
  }

  public float getAngle(){
    return angle;
  }
  
}

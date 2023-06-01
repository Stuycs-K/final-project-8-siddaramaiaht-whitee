class Flipper extends Stopper{
  final int wi = 20; //width 
  final int len = 60; //length
  final float initialSwingSpeed = 7; // initial speed of the swing
  final float flipperMass = 30; // mass of flipper to determine how much force it will exert on the ball
  final float swingSweep = 70; // angle that the flipper sweeps 
  private float swingSpeed; // speed of swing in degrees per frame
  final float swingAcceleration = -1 * (initialSwingSpeed * initialSwingSpeed) / (2 * swingSweep); // acceleration of swing in degress per frame^2
  private float angle; // angle to the inward horizontal at their current position
  final float initialAngle = -45;
  final float finalAngle = initialAngle + swingSweep;
  private int side; // 0 for left, 1 for right
  
  private boolean up;
  
  final int leftX = 200;
  final int leftY = 450;
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
    up = true;
  }
  
  public void swing(){
    //System.out.println(swingSpeed);
    if (up){
      if (angle < finalAngle - swingSpeed){
        angle += swingSpeed;
        swingSpeed += swingAcceleration;
      }else{
        angle = finalAngle;
        up = false;
        swingSpeed = 0;
      }
    }else{
      if (angle == finalAngle){
        swingSpeed = initialSwingSpeed;
      }
      if (angle > initialAngle + swingSpeed){
        angle -= swingSpeed;
        swingSpeed += swingAcceleration;
      }else{
        angle = initialAngle;
        up = true;
        swingSpeed = initialSwingSpeed;
      }
    }
    
    //System.out.println(swingSpeed);
    System.out.println(up);
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
      rect(-1 * len, -1 * wi / 2, 2 * len, wi);
      popMatrix();
    }else{
      pushMatrix();
      translate(width - leftX, y);
      rotate(radians(angle));
      rect(-1 * len, -1 * wi / 2, 2 * len, wi);
      popMatrix();
    }
  }

  public float getAngle(){
    return angle;
  }
  
  public float getAngleI(){
    return initialAngle;
  }
  
}

class Flipper extends Stopper{
  final int wi = 20; //width 
  final int len = 60; //length
  final float flipperMass = 30; // mass of flipper to determine how much force it will exert on the ball
  final float swingSweep = 70; // angle that the flipper sweeps 
  final float initialSwingSpeedMax = 20;
  final float defaultInitialSwingSpeed = initialSwingSpeedMax / 2; 
  // initialSwingSpeed at strength = 0
  final float initialAngle = -45;
  final float finalAngle = initialAngle + swingSweep;
  
  private float initialSwingSpeed; // initial speed of the swing
  private float swingSpeed; // speed of swing in degrees per frame
  private float swingAcceleration; // acceleration of swing in degress per frame^2
  private float angle; // angle to the inward horizontal at their current position
  private int side; // 0 for left, 1 for right
  private float strength; // strength of the swing in terms of initialSpeed
  private float[][] hitbox; // [[innerX, innerY], [outerX, outerY]]
  
  private boolean up; // true if going upwards or at rest, false if going downwards
  
  final int leftX = 300;
  final int leftY = 675;
  final int rightX = 800 - leftX;
  final int rightY = leftY;
  
  public Flipper(int si){
    hitbox = new float[2][2];
    if (si == 0){
      pos = new PVector(leftX, leftY);
      hitbox[0][0] = leftX - len * cos(initialAngle);
      hitbox[0][1] = leftY + len * sin(initialAngle);
      hitbox[1][0] = leftX + len * cos(initialAngle);
      hitbox[1][1] = leftY - len * sin(initialAngle);
    }
    if (si == 1){
      pos = new PVector(rightX, rightY);
      hitbox[0][0] = rightX - len * cos(initialAngle);
      hitbox[0][1] = rightY + len * sin(initialAngle);
      hitbox[1][0] = rightX + len * cos(initialAngle);
      hitbox[1][1] = rightY - len * sin(initialAngle);
    }
    angle = initialAngle;
    swingSpeed = defaultInitialSwingSpeed;
    initialSwingSpeed = defaultInitialSwingSpeed;
    swingAcceleration = -1 * (initialSwingSpeed * initialSwingSpeed) / (2 * swingSweep);
    side = si;
    up = true;
    strength = 0;
  }
  
  public void updateHitbox(){
    if (side == 0){
      hitbox[0][0] = leftX - len * cos(radians(angle));
      hitbox[0][1] = leftY + len * sin(radians(angle));
      hitbox[1][0] = leftX + len * cos(radians(angle));
      hitbox[1][1] = leftY - len * sin(radians(angle));
      /*stroke(0);
      fill(0);
      circle(hitbox[0][0], hitbox[0][1], 5);
      stroke(255);
      fill(255);
      circle(hitbox[1][0], hitbox[1][1], 5);*/
    }
    if (side == 1){
      hitbox[0][0] = rightX + len * cos(radians(angle));
      hitbox[0][1] = rightY + len * sin(radians(angle));
      hitbox[1][0] = rightX - len * cos(radians(angle));
      hitbox[1][1] = rightY - len * sin(radians(angle));
      /*stroke(0);
      fill(0);
      circle(hitbox[0][0], hitbox[0][1], 5);
      stroke(255);
      fill(255);
      circle(hitbox[1][0], hitbox[1][1], 5);*/
    }
  }
  
  public void swing(){
    //System.out.println(swingSpeed);
    if (up){
      if (angle == initialAngle){
        swingSpeed = initialSwingSpeed;
      }
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
    //System.out.println(up);
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
      //rect(-1 * len, 0, 2 * len, wi);
      triangle(-1 * len, 0, len, 0, -1 * len, wi);
      popMatrix();
    }else{
      pushMatrix();
      translate(width - leftX, y);
      rotate(radians(angle));
      //rect(-1 * len, 0, 2 * len, wi);
      triangle(-1 * len, 0, len, 0, len, wi);
      popMatrix();
    }
  }
  
  public void strengthDisplay(){
     stroke(0);
     fill(0);
     rect(width - 15, height / 2 - 100, 10, 200);
     float ratio = initialSwingSpeed / initialSwingSpeedMax;
     color bar = color(ratio * 255, abs(ratio - 0.5) * 255 * 2, (1 - ratio) * 255);
     stroke(bar);
     fill(bar);
     rect(width - 14, height / 2 + 99 - (int)(ratio * 198), 8, (int)(ratio * 198));
     stroke(125);
     fill(125);
     rect(width - 16, height / 2 - 1, 12, 2);
  }

  public float getAngle(){
    return angle;
  }
  
  public float getAngleI(){
    return initialAngle;
  }
  
  public void changeStrength(float deltaStrength){
    if ((getAngle() == initialAngle) && (initialSwingSpeed + deltaStrength > 0) && (initialSwingSpeed + deltaStrength <= initialSwingSpeedMax)){
      strength += deltaStrength;
      initialSwingSpeed += deltaStrength;
      swingAcceleration = -1 * (initialSwingSpeed * initialSwingSpeed) / (2 * swingSweep);
    }
  }
  
}

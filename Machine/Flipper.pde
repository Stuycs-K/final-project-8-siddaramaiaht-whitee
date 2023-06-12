class Flipper extends Stopper{
  final float flipperMass = 1.5; // mass of flipper to determine how much force it will exert on the ball
  final float swingSweep = 70; // angle that the flipper sweeps 
  final float initialSwingSpeedMax = 20;
  final float defaultInitialSwingSpeed = initialSwingSpeedMax / 2; // initialSwingSpeed at strength = 0
  final float initialAngle = -45;
  final float finalAngle = initialAngle + swingSweep;
  
  private float initialSwingSpeed; // initial speed of the swing
  private float ratio;
  private float swingSpeed; // speed of swing in degrees per frame
  private float swingAcceleration; // acceleration of swing in degress per frame^2
  private float angle; // angle to the inward horizontal at their current position
  private int side; // 0 for left, 1 for right
  private float strength; // strength of the swing in terms of initialSpeed
  
  private float[][] hitbox; // [[innerX, innerY], [outerX, outerY]]
  private boolean up; // true if going upwards or at rest, false if going downwards
  
  private PVector[] vertices;
  
  public Flipper(int si, int x, int y, int wi, int he, float k, int s){
    super(x, y, wi, he, k, s); 
    vertices = new PVector[3];
    hitbox = new float[2][2];
    if (si == 0){
      hitbox[0][0] = leftX + len * cos(radians(initialAngle));
      hitbox[0][1] = leftY + len * sin(radians(initialAngle));
      hitbox[1][0] = leftX - len * cos(radians(initialAngle));
      hitbox[1][1] = leftY - len * sin(radians(initialAngle));
    }
    if (si == 1){
      hitbox[0][0] = rightX - len * cos(radians(initialAngle));
      hitbox[0][1] = rightY + len * sin(radians(initialAngle));
      hitbox[1][0] = rightX + len * cos(radians(initialAngle));
      hitbox[1][1] = rightY - len * sin(radians(initialAngle));
    }
    angle = initialAngle;
    swingSpeed = defaultInitialSwingSpeed;
    initialSwingSpeed = defaultInitialSwingSpeed;
    swingAcceleration = -1 * (initialSwingSpeed * initialSwingSpeed) / (2 * swingSweep);
    side = si;
    up = true;
    strength = 0;
  }
  
  public boolean bounce(Ball ball){
    return super.bounce(ball, vertices[0], vertices[1]) || super.bounce(ball, vertices[0], vertices[2]) || super.bounce(ball, vertices[1], vertices[2]);
  }
  
  public void updateHitbox(){
    if (side == 0){
      hitbox[0][0] = leftX + len * cos(radians(angle));
      hitbox[0][1] = leftY + len * sin(radians(angle));
      hitbox[1][0] = leftX - len * cos(radians(angle));
      hitbox[1][1] = leftY - len * sin(radians(angle));
    }
    if (side == 1){
      hitbox[0][0] = rightX - len * cos(radians(angle));
      hitbox[0][1] = rightY + len * sin(radians(angle));
      hitbox[1][0] = rightX + len * cos(radians(angle));
      hitbox[1][1] = rightY - len * sin(radians(angle));
    }
  }
  
  public void swing(){
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
      vertices[0] = new PVector(-1 * len, 0);
      vertices[1] = new PVector(len, 0);
      vertices[2] = new PVector(-1 * len, wi);
      vertices[0].rotate(-1 * radians(angle));
      vertices[1].rotate(-1 * radians(angle));
      vertices[2].rotate(-1 * radians(angle));
      PVector t = new PVector(x, y);
      vertices[0].add(t);
      vertices[1].add(t);
      vertices[2].add(t);
      triangle(-1 * len, 0, len, 0, -1 * len, wi);
      popMatrix();
    }else{
      pushMatrix();
      translate(width - leftX, y);
      rotate(radians(angle));
      //rect(-1 * len, 0, 2 * len, wi);
      vertices[0] = new PVector(-1 * len, 0);
      vertices[1] = new PVector(len, 0);
      vertices[2] = new PVector(len, wi);
      vertices[0].rotate(radians(angle));
      vertices[1].rotate(radians(angle));
      vertices[2].rotate(radians(angle));
      PVector t = new PVector(width-leftX, y);
      vertices[0].add(t);
      vertices[1].add(t);
      vertices[2].add(t);

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
  
  public void changeStrength(float deltaStrength){
    if ((getAngle() == initialAngle) && (initialSwingSpeed + deltaStrength > 0) && (initialSwingSpeed + deltaStrength <= initialSwingSpeedMax)){
      strength += deltaStrength;
      initialSwingSpeed += deltaStrength;
      swingAcceleration = -1 * (initialSwingSpeed * initialSwingSpeed) / (2 * swingSweep);
    }
  }
  
  public float getBounciness(){
    return super.getBounciness() * flipperMass * abs(swingAcceleration);
  }
  
   public float getAngle(){
    return angle;
  }
  
  public float getAngleI(){
    return initialAngle;
  }
  
}

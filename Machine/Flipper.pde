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
    //left.updateHitbox();
    //right.updateHitbox();
    float stopX = hitbox[0][0];
    float stopY = hitbox[1][1];
    /*stroke(0);
    fill(1);
    circle(stopX, stopY, 10);*/
    /*if (side == 1){
      //return super.bounce(ball, stopX, stopY);
      return true;
    }else{
      float ballX = ball.getPos().x;
      float ballY = ball.getPos().y;
      float vX = ball.getV().x;
      float vY = ball.getV().y;
      float r = ball.getRadius();
      
      if(ballX - r + vX < stopX && ballX + r + vX > stopX - getWidth() && ballY - r < stopY + getHeight() && ballY + r > stopY){
        ball.getV().set(-1*vX, vY);
        ball.getV().mult(getBounciness());
        return true;
      }
      if(ballY - r + vY < stopY + getHeight() && ballY + r +  vY > stopY && ballX - r < stopX && ballX + r > stopX - getWidth()){
        ball.getV().set(vX, -1*vY);
        ball.getV().mult(getBounciness());
        return true;
      }
      return false;
    }*/
    if(super.bounce(ball, vertices[0], vertices[1]) || super.bounce(ball, vertices[0], vertices[2]) || super.bounce(ball, vertices[1], vertices[2])){
      System.out.println("no");
      triangle(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y);
    }
    return false;
  }
  
  public void updateHitbox(){
    if (side == 0){
      hitbox[0][0] = leftX + len * cos(radians(angle));
      hitbox[0][1] = leftY + len * sin(radians(angle));
      hitbox[1][0] = leftX - len * cos(radians(angle));
      hitbox[1][1] = leftY - len * sin(radians(angle));
      /*stroke(0);
      fill(0);
      circle(hitbox[0][0], hitbox[0][1], 5);
      stroke(255);
      fill(255);
      circle(hitbox[1][0], hitbox[1][1], 5);*/
    }
    if (side == 1){
      hitbox[0][0] = rightX - len * cos(radians(angle));
      hitbox[0][1] = rightY + len * sin(radians(angle));
      hitbox[1][0] = rightX + len * cos(radians(angle));
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

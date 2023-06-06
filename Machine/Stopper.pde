class Stopper{
  public PVector pos;
  private float bounciness;
  private int w; //width of hitbox
  private int h; //height of hitbox
  private float[][] hitbox;
  private float[] hitboxCir;
  private int score;
  public Stopper(int x, int y, int wi, int he, float k, int s){
    pos = new PVector(x, y);
    bounciness = k;
    w = wi;
    h = he;
    score = s;
  }
  public Stopper(float[][] hit, float k, int s){
    hitbox = hit;
    bounciness = k;;
    score = s;
  }
  public Stopper(float[] hit, float k, int s){
    hitboxCir = hit;
    bounciness = k;
    score = s;
  }
  
  public float getBounciness(){
    return bounciness; 
  }
  
  public void display(){
    noStroke();
  }
  public boolean bounce(Ball ball, float stopX, float stopY, String type){
    float ballX = ball.getPos().x;
    float ballY = ball.getPos().y;
    float vX = ball.getV().x;
    float vY = ball.getV().y;
    float r = ball.getRadius();
    
    if (type == "rect"){
      if(ballX - r + vX < stopX + getWidth() && ballX + r + vX > stopX && ballY - r < stopY + getHeight() && ballY + r > stopY){
        ball.getV().set(-1*vX, vY);
        ball.getV().mult(getBounciness());
        return true;
      }
      if(ballY - r + vY < stopY + getHeight() && ballY + r +  vY > stopY && ballX - r < stopX + getWidth() && ballX + r > stopX){
        ball.getV().set(vX, -1*vY);
        ball.getV().mult(getBounciness());
        return true;
      }
    }
    
    else if(type == "tri"){
      if (hitbox.length == 2){
        float a = hitbox[0][0];
        float b = hitbox[0][1];
        float c = hitbox[1][0];
        float d = hitbox[1][1];
        float vBall = vY / vX; // the slope of the trajectory of the ball
        float m = (b - d) / (a - c); // slope of the hitbox (which is a line formed by the two points in hitbox[][])
        float normal = -1 / m; // slope of the perpendicular to the hitbox
        float u = (2 * normal + vBall * sq(normal) - vBall) / (1 - sq(normal) + 2 * vBall * normal);
        float theta = atan(u);
        ball.setVelocity(new PVector(sqrt(sq(vX) + sq(vY)) * bounciness * cos(theta), sqrt(sq(vX) + sq(vY)) * bounciness * sin(theta)));
        if(m > 0 && vX < 0 && vY < 0){
          ball.multVelocity(-1);
        }
        if (m < 0 && vX > 0 && vY > 0){
          ball.multVelocity(-1);
        }
      }
    }
    
    else if (type == "cir"){
      
    }
    
    return false;
  }
  public PVector getPos(){
    return pos;
  }
  public int getWidth(){
    return w;
  }
  public int getHeight(){
    return h;
  }
  public int getScore(){
    return score;
  }
}

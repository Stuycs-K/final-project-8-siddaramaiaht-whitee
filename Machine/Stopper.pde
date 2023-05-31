class Stopper{
  private PVector pos;
  private float bounciness;
  private int w; //width of hitbox
  private int h; //height of hitbox
  private int score;
  public Stopper(int x, int y, float k, int s){
    pos = new PVector(x, y);
    bounciness = k;
    score = s;
  }
  public Stopper(int x, int y, int wi, int he, float k, int s){
    pos = new PVector(x, y);
    bounciness = k;
    w = wi;
    h = he;
    score = s;
  }
  public float getBounciness(){
    return bounciness; 
  }
  public void display(){
    
  }
  public boolean bounce(Ball ball, float stopX, float stopY){
    float ballX = ball.getPos().x;
    float ballY = ball.getPos().y;
    float vX = ball.getV().x;
    float vY = ball.getV().y;
    float r = ball.getRadius();
    
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

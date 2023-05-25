class Stopper{
  private PVector pos;
  private float bounciness;
  private int w; //width of hitbox
  private int h; //height of hitbox
  public Stopper(int x, int y, float k){
    pos = new PVector(x, y);
    bounciness = k;
  }
  public Stopper(int x, int y, int wi, int he, float k){
    pos = new PVector(x, y);
    bounciness = k;
    w = wi;
    h = he;
  }
  public float getBounciness(){
    return bounciness; 
  }
  public void display(){
    
  }
  public boolean collide(Ball ball){
    float ballX = ball.getPos().x;
    float ballY = ball.getPos().y;
    float stopX = getPos().x;
    float stopY = getPos().y;
    return (ballX < stopX + getWidth() && ballX < stopX + getWidth() && ballY < stopY + getWidth() && ballY > stopX - getWidth());
  }
  public void bounce(Ball ball){
    if (collide(ball)){
      ball.applyForce(ball.getAcc().copy().setMag(-1*getBounciness()));
    }
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
}

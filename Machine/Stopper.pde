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
    if(ballX == stopX){
      ball.getV().mult(-1);//*bounciness);
    }
    if(ballY == stopY){
      ball.getV().mult(-1);//*bounciness);
    }
    /*if( (ballX < stopX + getWidth() && ballX > stopX && ballY < stopY + getHeight() && ballY > stopY)){
      System.out.println("hi");
      return true;
    }*/
    return false;
  }/*
  public void bounce(Ball ball){
    if (collide(ball)){
      ball.getV().mult(-1);//*bounciness);
      System.out.println(ball.getV());
    }
  }*/
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

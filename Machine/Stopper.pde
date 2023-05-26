class Stopper{
  private PVector pos;
  private float bounciness;
  private int w; //width of hitbox
  private int h; //height of hitbox
  public Stopper(int x, int y){
    pos = new PVector(x,y);
  }
  public Stopper(int x, int y, float k){
    pos = new PVector(x, y);
    bounciness = k;
  }
  public Stopper(int x, int y, int wi, int he){
    pos = new PVector(x, y);
    w = wi;
    h = he;
  }
  public Stopper(int x, int y, int wi, int he, float k){
    pos = new PVector(x, y);
    bounciness = k;
    w = wi;
    h = he;
  }
  
  public PVector getPos(){
    return pos;
  }
  
  public float getBounciness(){
    return bounciness; 
  }
  
  public void display(){
    
  }
  
  public boolean collide(PVector ballPos){
    return false; // to compile
  }
  
  public void bounce(Ball ball){
    if (collide(ball.getPos())){
      // bounce equation goes here
    }
  }
}

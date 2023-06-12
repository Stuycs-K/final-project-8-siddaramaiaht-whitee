class Stopper{
  public PVector pos;
  private float bounciness;
  private int w; //width of hitbox
  private int h; //height of hitbox
  private int score;
  public Stopper(){}
  public Stopper(float k, int s){
    bounciness = k;
    score = s;
  }
  public Stopper(int x, int y){
    pos = new PVector(x,y);
  }
  public Stopper(int x, int y, float k){
    pos = new PVector(x, y);
    bounciness = k;
  }
  public Stopper(int x, int y, float k, int s){
    pos = new PVector(x, y);
    bounciness = k;
    score = s;
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
    noStroke();
  }
  public boolean bounce(Ball ball, PVector v1, PVector v2){//float stopX, float stopY){
    float ballXI = ball.getPos().x;
    float ballYI = ball.getPos().y;
    PVector slope = PVector.sub(v2, v1);
    PVector a = PVector.sub(PVector.add(ball.getPos(), ball.getV()), v1);
    float dot = a.dot(slope)/slope.magSq();
    if(dot > 1){
      //return false;
      dot = 1;
    }
    else if(dot < 0){
      //return false;
      dot = 0;
    }
    PVector closest = PVector.add(v1, PVector.mult(slope, dot));
    //PVector dist = PVector.sub(closest, ball.getPos());
    if(PVector.dist(PVector.add(ball.getPos(), ball.getV()), closest) < ball.getRadius()){
      PVector norm = slope.copy().set(-1*slope.y, slope.x);
      PVector u = PVector.mult(norm, ball.getV().dot(norm)/norm.magSq());
      PVector w = PVector.sub(ball.getV(), u);
      PVector newV = PVector.sub(w, u);
      ball.getV().set(PVector.mult(newV, bounciness));
      
      if(PVector.dist(PVector.add(ball.getPos(), ball.getV()), closest) < ball.getRadius()){
        ball.setPos(new PVector(ballXI, ballYI));
        slope.normalize();
        float slopeAngle = atan(slope.y/slope.x);
        slope.mult(9.81 * cos(slope.y/slope.x));
        //slope.add(9.81 * cos(slopeAngle) * -1, 9.81 * sin(slopeAngle) * 1);
        ball.setV(slope);
        System.out.println("walls phase fix called");
      }
      
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

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
    /*float ballX = ball.getPos().x;
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
    return false;*/
    /*PVector slope = PVector.sub(v2, v1);
    PVector a = PVector.sub(PVector.add(ball.getPos(), ball.getV()), v1);
    float crossMag = (a.cross(slope)).mag();
    float dist = crossMag/slope.mag();
    //if(PVector.add(ball.getPos(), ball.getV()).dist(v1) <= ball.getRadius() || PVector.add(ball.getPos(), ball.getV()).dist(v2) <= ball.getRadius()){
      //return true;
    //}
    //PVector slope = PVector.sub(v2, v1);
    //PVector a = PVector.sub(PVector.add(ball.getPos(), ball.getV()), v1);
    //float dot = a.dot(
    
    if(dist < ball.getRadius()){
      PVector norm = slope.copy().set(-1*slope.y, slope.x);
      float angle = PVector.angleBetween(ball.getV(), norm);
      System.out.println(degrees(angle));
      //if(slope.y/slope.x < 0){
        
      ball.getV().rotate(-1*angle);
    }
    return false;
    */
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
        ball.multV(0);
        ball.setAcc(new PVector(0, 0));
        System.out.println("anti phase fix was called");
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

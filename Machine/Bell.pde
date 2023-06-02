class Bell extends Stopper{
  final int bellK = 1;
  final int mass = 5000;
  public Bell(int x, int y, int r, int s){
    super(x, y, r, r, 1, s);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    ellipse(x, y, w, h);
  }
  public int getRadius(){
    return getWidth()/2;
  }
  public boolean bounce(Ball ball){
    /*float stopX = getPos().x - getWidth()/2;
    float stopY = getPos().y - getHeight()/2;
    super.bounce(ball, stopX, stopY);*/
    //if(getPos().dist(ball.getPos()) < getWidth()/2 + ball.getRadius()){
      float stopX = getPos().x - getWidth()/2;
      float stopY = getPos().y - getHeight()/2;
      return super.bounce(ball, stopX, stopY);
    //}
    //return false;
    /*float stopX = getPos().x;
    float stopY = getPos().y;
    float ballX = ball.getPos().x;
    float ballY = ball.getPos().y;
    //Pvector radii = new PVector(getRadius(), ball.getRadius());
    PVector norm = PVector.sub(getPos(), new PVector(stopX*ball.getRadius()+ballX*getRadius(), stopY*ball.getRadius()+ballY*getRadius()).div(getRadius()+ball.getRadius())).rotate(HALF_PI);
    if(getPos().dist(ball.getPos().copy().add(ball.getV())) <= ball.getRadius() + getRadius()){
      System.out.println("hi");
      float p = 2*PVector.dot(ball.getV(), norm)/(mass + Ball.mass);
      ball.getV().set(ball.getV().copy().sub(PVector.mult(norm, (mass-Ball.mass)*p)).setMag(ball.getV().mag()));
      //ball.getPos().set((stopX*ball.getRadius
      //ball.getV().rotate(-1*HALF_PI);
      return true;
    }
    return false;*/
  }
}

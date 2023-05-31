class Bell extends Stopper{
  final int bellK = 1;
  public Bell(int x, int y, int r, int s){
    super(x, y, r, r, 1.0, s);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    ellipse(x, y, w, h);
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
  }
}

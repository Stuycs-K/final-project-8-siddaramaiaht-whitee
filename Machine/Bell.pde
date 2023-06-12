class Bell extends Stopper{
  static final int green = 1;
  static final int blue = 3;
  static final int purple = 5;
  final int bellK = 1;
  final int mass = 5000;
  public Bell(int x, int y, int r, int s){
    super(x, y, r, r, 1.1, s);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    stroke(100);
    if (getScore() == green){
      fill(90, 200, 90);
    }
    else if (getScore() == blue){
      fill(70, 90, 200);
    }
    else if (getScore() == purple){
      fill(150, 70, 200);
    }
    ellipse(x, y, w, h);
  }
  public int getRadius(){
    return getWidth()/2;
  }
  public boolean bounce(Ball ball){
    if(getPos().dist(ball.getPos().copy().add(ball.getV())) <= ball.getRadius() + getRadius()){
      if(PVector.add(ball.getPos(), ball.getV()).dist((getPos())) <= ball.getRadius() + getRadius()){
        PVector normal = PVector.sub(getPos(), ball.getPos());
        normal.normalize();
        float v1i = ball.getV().dot(normal);
        float v1f = (-1*v1i);
    
        ball.getV().add(normal.mult(v1f-v1i));
        return true;
      }

    }
    return false;
  }
}

class Bell extends Stopper{
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
    ellipse(x, y, w, h);
  }
  public int getRadius(){
    return getWidth()/2;
  }
  public boolean bounce(Ball ball){
    /*float stopX = getPos().x - getWidth()/2;
    float stopY = getPos().y - getHeight()/2;
    super.bounce(ball, stopX, stopY);
    //if(getPos().dist(ball.getPos()) < getWidth()/2 + ball.getRadius()){
      float stopX = getPos().x - getWidth()/2;
      float stopY = getPos().y - getHeight()/2;
      return super.bounce(ball, stopX, stopY);
    //}
    //return false;*/
    /*float stopX = getPos().x;
    float stopY = getPos().y;
    float ballX = ball.getPos().x;
    float ballY = ball.getPos().y;
    //Pvector radii = new PVector(getRadius(), ball.getRadius());
    PVector norm = PVector.sub(getPos(), new PVector(stopX*ball.getRadius()+ballX*getRadius(), stopY*ball.getRadius()+ballY*getRadius()).div(getRadius()+ball.getRadius())).rotate(-1*HALF_PI);
    if(getPos().dist(ball.getPos().copy().add(ball.getV())) <= ball.getRadius() + getRadius()){
      System.out.println("hi");
      float p = 2*PVector.dot(ball.getV(), norm)/(mass + Ball.mass);
      PVector vCopy = ball.getV().copy();
      vCopy.set(ball.getV().copy().sub(PVector.mult(norm, (mass-Ball.mass)*p)).setMag(ball.getV().mag()));
      //ball.getPos().set((stopX*ball.getRadius
      //ball.getV().rotate(-1*HALF_PI);
      ball.getV().rotate(PVector.angleBetween(ball.getV(), vCopy)/2);
      return true;
    }
    return false;
  }*/
    if(getPos().dist(ball.getPos().copy().add(ball.getV())) <= ball.getRadius() + getRadius()){
      /*PVector dist = PVector.sub(ball.getPos(), getPos());
      PVector norm = dist.copy().set(-1*dist.y, dist.x);
      PVector mid = PVector.add(ball.getPos(), getPos()).mult(0.5);
      //float a = ball.getRadius()*Math.abs(ball.getPos().x - getPos().x)/(getRadius()+ball.getRadius());
      //float b = ball.getRadius()*Math.abs(ball.getPos().y - getPos().y)/(getRadius()+ball.getRadius());
      //PVector collide = PVector.add(ball.getPos(), new PVector(a, b));
      //norm.add(mid);
      PVector u = PVector.mult(norm, ball.getV().dot(norm)/norm.magSq());
      PVector w = PVector.sub(ball.getV(), u);
      PVector newV = PVector.sub(w, u);
      ball.getV().set(PVector.mult(newV, getBounciness()));
      return true;
      //float m = dist.y/dist.x;
      //PVector v1 = new PVector((m*mid.x-mid.y)/m, 0);
      //PVector v2 = new PVector(0, mid.y-m*mid.x);
      //return super.bounce(ball, v1, v2);
      /*PVector dist = PVector.sub(ball.getPos(), getPos());
      float overlap = ball.getRadius()+getRadius()-dist.mag();
      PVector n = //dist.normalize();
      ball.getPos().add(dist.mult(overlap));
      float dot = ball.getV().dot(dist);
      (ball.getV().add(n.mult(2*dot))).mult(getBounciness());
      return true;*/
      //float a = ball.getRadius()*Math.abs(ball.getPos().x - getPos().x)/(getRadius()+ball.getRadius());
      //float b = ball.getRadius()*Math.abs(ball.getPos().y - getPos().y)/(getRadius()+ball.getRadius());
      //PVector collide = PVector.add(ball.getPos(), new PVector(a, b));
      //ball.getV().mult(-1);
      
      if(PVector.add(ball.getPos(), ball.getV()).dist((getPos())) <= ball.getRadius() + getRadius()){
        PVector normal = PVector.sub(getPos(), ball.getPos());
        normal.normalize();
        float v1i = b.getV().dot(normal);
        float v1f = (-1*v1i);
    
        ball.getV().add(normal.mult(v1f-v1i));
        return true;
      }

    }
    return false;
  }
}

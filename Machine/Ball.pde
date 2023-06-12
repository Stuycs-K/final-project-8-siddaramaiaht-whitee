class Ball{

private PVector position;
private PVector velocity;
private PVector acceleration;
private int score;
private int radius;
private int mass;

public Ball(PVector x, PVector v, PVector a, int r, int m){
  position = x;
  velocity = v;
  acceleration = a;
  radius = r;
  mass = m;
}

public void applyForce(PVector F){
  acceleration.add(F.div(mass));
}

public void move(){
  //velocity.add(new PVector(0, 0.098));
  velocity.add(acceleration);
  //velocity.y =- 9.8 / mass; gravity will be used later
  position.add(velocity);
  acceleration.set(0, 0);
  if(position.x > 720){
    float numX = (position.x - 720)/velocity.x+0;
    position.y -= (numX*velocity.y-0);
    position.x = 700-getRadius();
  }
  if(position.x < 100){
    float numX = (position.x - 100)/velocity.x+0;
    position.y -= (numX*velocity.y-0);
    position.x = 120+getRadius();
  }
  if(position.y < 100){
    float numY = (position.y - 100)/velocity.y+0;
    position.x -= (numY*velocity.x-0);
    position.y = 120+getRadius();
  }
  if(position.y > 720 && (position.x < 300 || position.x > 520)){
    float numY = (position.y - 720)/velocity.y+0;
    position.x -= (numY*velocity.x-0);
    position.y = 700-getRadius();
  }
  if(velocity.mag() >= 30){
    velocity.setMag(30);
  }
  /*if(Math.abs(velocity.y) < 0.1 && velocity.y > 0){
    velocity.y = 0.1*velocity.y/Math.abs(velocity.y);
  }*/
  if(position.y > 720 + getRadius() && position.x >= 300 && position.x <= 520){
    Machine.MODE = 1;
  }
  /*if(velocity.mag() == 0){
    Machine.MODE = 1;
  }*/
}

public void display(){
  fill(255);
  stroke(0);
  circle(position.x, position.y, radius);
}

public PVector getPos(){
  return position;
}
public PVector getAcc(){
  return acceleration;
}
public PVector getV(){
  return velocity;
}
public int getRadius(){
  return radius/2;
}
public int getScore(){
  return score;
}
public void addScore(int s){
  score += s;
}
public int getMass(){
  return mass;
}
public void bounce(Ball ball){
  if((ball.getPos()).dist((getPos())) <= ball.getRadius() + getRadius()){
    PVector normal = PVector.sub(ball.getPos(), getPos());
    normal.normalize();
    float v1i = ball.getV().dot(normal);
    float v2i = getV().dot(normal);
    float v1f = (v1i*(getMass()-ball.getMass())+v2i*(2*ball.getMass()))/(getMass() + ball.getMass());
    float v2f = (v2i*(ball.getMass()-getMass())+v1i*(2*getMass()))/(getMass() + ball.getMass());

    ball.getV().add(normal.mult(v1f-v1i));
    getV().add(normal.mult(v2f-v2i));
  }
/*
    PVector tangent = new PVector(-1*normal.y, normal.x);
    float v1n = normal.dot(getV());
    float v1t = tangent.dot(getV());
    float v2n = normal.dot(b.getV());
    float v2t = tangent.dot(b.getV());
    float va1n = (v1n*(getMass()-b.getMass())+v2n*(2*b.getMass()))/(getMass() + b.getMass());
    float va2n = (v2n*(b.getMass()-getMass())+v1n*(2*getMass()))/(getMass() + b.getMass());
    PVector vea1n = normal.mult(va1n);
    PVector vea1t = tangent.mult(v1t);
    PVector vea2n = normal.mult(va2n);
    PVector vea2t = tangent.mult(v2t);
    
    PVector va1 = PVector.add(vea1n, vea1t);
    PVector va2 = PVector.add(vea2n, vea2t);
    
    getV().set(va1);
    b.getV().set(va2);
  }
  /*float a1 = getV().dot(n);
  float a2 = b.getV().dot(n);
  
  float optimizedP = (2.0 * (a1 - a2)) / (getMass() + b.getMass());
  
  // Calculate v1', the new movement vector of circle1
  // v1 = v1 - optimizedP * m2 * n
  PVector v1 = getV() - optimizedP * b.getMass() * n;
  
  // Calculate v2', the new movement vector of circle2
  // v2 = v2 + optimizedP * m1 * n
  PVector v2 = b.getV() + optimizedP * getMass() * n;
  
  getV().set(v1);
  b.getV().set(v2);
}*/
}
}

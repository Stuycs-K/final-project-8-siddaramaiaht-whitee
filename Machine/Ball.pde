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
  velocity.add(new PVector(0, 0.098));
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
  Float pX = new Float(position.x);
  Float pY = new Float(position.y);
  if((position.y > 720 + getRadius() && position.x >= 300 && position.x <= 520) || position.x <= 0 || position.x >= width || position.y <= 0 || position.y >= height || pX.isNaN() || pY.isNaN()){
    Machine.MODE = Machine.OVER;
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
public void setPos(PVector newPos){
  position = newPos;
}
public PVector getAcc(){
  return acceleration;
}
public void setAcc(PVector newAcc){
  acceleration = newAcc;
}
public PVector getV(){
  return velocity;
}
public void multV(float x){
  velocity = velocity.mult(x);
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
  if(PVector.add(ball.getPos(), ball.getV()).dist(PVector.add(getPos(), getV())) <= ball.getRadius() + getRadius()){
    PVector normal = PVector.sub(ball.getPos(), getPos());
    PVector vDiff = PVector.sub(ball.getV(), getV());
    float massSum = ball.getMass() + getMass();
    float dot = normal.dot(vDiff)/normal.magSq();
    PVector v1 = PVector.mult(normal, 2*getMass()/massSum * dot);
    PVector v2 = PVector.mult(normal, -1*2*ball.getMass()/massSum * dot);
    ball.getV().sub(v1);
    getV().sub(v2);
  }
}
}

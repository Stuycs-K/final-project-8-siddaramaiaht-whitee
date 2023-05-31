class Ball{

private PVector position;
private PVector velocity;
private PVector acceleration;
private int score;
final int radius = 50;
final int mass = 80;

public Ball(PVector x, PVector v, PVector a){
  position = x;
  velocity = v;
  acceleration = a;
}

public void applyForce(PVector F){
  acceleration.add(F.div(mass));
}

public void move(){
  velocity.add(acceleration);
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
  if(position.y > 720 && (position.x < 350 || position.x > 470)){
    float numY = (position.y - 720)/velocity.y+0;
    position.x -= (numY*velocity.x-0);
    position.y = 700-getRadius();
  }
  if(velocity.mag() >= 30){
    velocity.setMag(50);
  }
  if(position.x >= 350 && position.x <= 470)){
    MACHINE.MODE = 1;
    position.set(500, 500);
    velocity.set(0, 0);
    acceleration.set(0, 0);
  }
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

}

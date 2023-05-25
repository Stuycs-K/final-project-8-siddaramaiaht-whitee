class Ball{

private PVector position;
private PVector velocity;
private PVector acceleration;
final int radius = 5;
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
  //velocity.y =- 9.8 / mass; gravity will be used later
  position.add(velocity);
}

public void display(){
  fill(255);
  stroke(0);
  circle(position.x, position.y, radius);
}

public PVector getPos(){
  return position;
}

}

class Ball{

private PVector position;
private PVector velocity;
private PVector acceleration;
final int ballSize = 5;
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
}

}

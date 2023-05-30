class Ball{

private PVector position;
private PVector velocity;
private PVector acceleration;
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
    //velocity.setMag(0);
    float numX = (position.x - 720)/velocity.x+1;
                System.out.println(position);
                System.out.println(numX);
                System.out.println(velocity);

    position.y -= (numX*velocity.y-0);
    position.x = 700-getRadius();
    System.out.println("hi1");
            System.out.println(position);
velocity.setMag(0);
acceleration.setMag(0);
move();
  }
  if(position.x < 100){
    //velocity.setMag(0);
    float numX = (position.x - 100)/velocity.x+1;
                System.out.println(position);
                System.out.println(numX);
                System.out.println(velocity);

    position.y -= (numX*velocity.y-0);
    position.x = 120+getRadius();
    System.out.println("hi2");
        System.out.println(position);
        velocity.setMag(0);
        acceleration.setMag(0);
move();
  }
  if(position.y < 100){
    //velocity.setMag(0);
    float numY = (position.y - 100)/velocity.y+1;
                System.out.println(position);
                System.out.println(numY);
                System.out.println(velocity);

    position.x -= (numY*velocity.x-0);
    position.y = 120+getRadius();
    System.out.println("hi3");
            System.out.println(position);
velocity.setMag(0);
acceleration.setMag(0);
move();
  }
  if(position.y > 720 && (position.x < 350 || position.x > 470)){
    //velocity.setMag(0);
    float numY = (position.y - 720)/velocity.y+1;
                System.out.println(position);
                System.out.println(numY);
                System.out.println(velocity);

    position.x -= (numY*velocity.x-0);
    position.y = 700-getRadius();
    System.out.println("hi4");
            System.out.println(position);
velocity.setMag(0);
acceleration.setMag(0);
move();
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

}

class Wall extends Stopper{
  final int wallK = 1;
  private PVector[] vertices;
  public Wall(int x, int y, int w, int h, int s){
    super(x, y, w, h, 0.9, s);
    vertices = new PVector[] {new PVector(x, y), new PVector(x, y+h), new PVector(x+w, y), new PVector(x+w, y+h)};
  }
  public void display(){
    super.display();
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    rect(x, y, w, h);
  }
  public boolean bounce(Ball ball){
    /*float stopX = getPos().x;
    float stopY = getPos().y;
    return super.bounce(ball, vertices[0], vertices[2]);*/
    //PVector v1 = vertices[0];
    //PVector v2 = vertices[2];
    /*PVector slope = PVector.sub(v2, v1);
    PVector a = PVector.sub(ball.getPos(), v1);
    PVector cross = (a.cross(slope)).cross(a);
    float dist = cross.dot(slope)/cross.mag();
    if(dist <= ball.getRadius()){
      System.out.println("hi1");
      return true;
    }
    return false;*/
    return super.bounce(ball, vertices[0], vertices[1]) || super.bounce(ball, vertices[0], vertices[2]) || super.bounce(ball, vertices[1], vertices[3]) || super.bounce(ball, vertices[2], vertices[3]);
  }
  public PVector[] getVertices(){
    return vertices;
  }
}

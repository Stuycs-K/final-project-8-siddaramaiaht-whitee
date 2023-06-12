class Bumper extends Stopper{
  private PVector[] vertices;
  public Bumper(int x1, int y1, int x2, int y2, int x3, int y3, float k, int s){
    super(x1, y1, 40, 10, 1.1, s);
    vertices = new PVector[] {new PVector(x1, y1), new PVector(x2, y2), new PVector(x3, y3)};
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    fill(100);
    triangle(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y);
  }
  public boolean bounce(Ball b){
    return super.bounce(b, vertices[0], vertices[1]) || super.bounce(b, vertices[0], vertices[2]) || super.bounce(b, vertices[1], vertices[2]);
  }
  public PVector[] getVertices(){
    return vertices;
  }
}

class Bumper extends Stopper{
  private PVector[] vertices;
  public Bumper(int x, int y, int k, int s){
    super(x, y, 40, 10, k, s);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    fill(100);
    triangle(x+20, y-40, x-50, y-50, x+20, y+50);
    vertices = new PVector[] {new PVector(x+20, y-40), new PVector(x-50, y-50), new PVector(x+20, y+50)};
  }
  public boolean bounce(Ball b){
    float x = this.getPos().x;
    float y = this.getPos().y;
    return super.bounce(b, vertices[0], vertices[1]) || super.bounce(b, vertices[0], vertices[2]) || super.bounce(b, vertices[1], vertices[2]);
  }
  public PVector[] getVertices(){
    return vertices;
  }
}

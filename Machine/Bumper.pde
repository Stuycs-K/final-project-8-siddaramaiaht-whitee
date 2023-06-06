class Bumper extends Stopper{
  private PVector[] vertices;
  public Bumper(int x, int y, int k, int s){
    super(x, y, 40, 10, k, s);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    fill(100);
    triangle(x, y, x-20, y+10, x+20, y+10);
    vertices = new PVector[] {new PVector(x, y), new PVector(x-20, y+10), new PVector(x+20, y+10)};
  }
  public boolean bounce(Ball b){
    float x = this.getPos().x;
    float y = this.getPos().y;
    return super.bounce(b, x-20, y+10);
  }
  public PVector[] getVertices(){
    return vertices;
  }
}

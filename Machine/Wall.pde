class Wall extends Stopper{
  final int wallK = 1;
  private PVector[] vertices;
  public Wall(int x, int y, int w, int h, int s){
    super(x, y, w, h, 1, s);
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
    float stopX = getPos().x;
    float stopY = getPos().y;
    return super.bounce(ball, stopX, stopY);
  }
  public PVector[] getVertices(){
    return vertices;
  }
}

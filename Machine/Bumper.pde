class Bumper extends Stopper{
  public Bumper(int x, int y, int k){
    super(x, y, k);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    triangle(x, y, x-20, y+10, x+20, y+10);
  }
}

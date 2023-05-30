class Bumper extends Stopper{
  public Bumper(int x, int y, int k){
    super(x, y, 40, 10, k);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    fill(100);
    triangle(x, y, x-20, y+10, x+20, y+10);
  }
  public void bounce(Ball b){
    float x = this.getPos().x;
    float y = this.getPos().y;
    super.bounce(b, x-20, y+10);
  }
}

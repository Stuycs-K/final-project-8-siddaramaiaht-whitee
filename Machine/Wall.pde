class Wall extends Stopper{
  final int wallK = 0;
  public Wall(int x, int y, int w, int h){
    super(x, y, w, h, 0);
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    rect(x, y, w, h);
  }
}

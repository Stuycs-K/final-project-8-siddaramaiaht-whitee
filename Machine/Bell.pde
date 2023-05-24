class Bell extends Stopper{
  private int score;
  final int bellK = 1;
  public Bell(int x, int y, int r, int s){
    super(x, y, r, r, 1);
    score = s;
  }
  public void display(){
    float x = this.getPos().x;
    float y = this.getPos().y;
    int w = this.getWidth();
    int h = this.getHeight();
    fill(100);
    ellipse(x, y, w, h);
  }
}

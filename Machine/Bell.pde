class Bell extends Stopper{
  private int score;
  private int bellK;
  public Bell(int x, int y, int r, int s){
    super(x, y, r, r, bellK);
    score = s;
  }
}

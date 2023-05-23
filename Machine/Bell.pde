class Bell extends Stopper{
  private int score;
  private int bounciness;
  public Bell(int x, int y, int s, int b){
    super(x, y);
    score = s;
    bounciness = b;
  }
  public int bounce(){
    return bounciness;
  }
}

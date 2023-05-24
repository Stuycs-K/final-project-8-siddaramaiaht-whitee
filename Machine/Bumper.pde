class Bumper extends Stopper{
  final bumperK = 1;
  public Bumper(int x, int y, int w, int h){
    super(x, y, w, h, bumperK);
  }
}

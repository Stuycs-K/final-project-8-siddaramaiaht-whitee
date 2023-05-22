class Stopper{
  private int returnCoeff;
  private PVector pos;
  
  public Stopper(int num, int x, int y){
    returnCoeff = num;
    pos = new PVector(x, y);
  }
  public int returnBounce(){
    return returnCoeff;
  }
}

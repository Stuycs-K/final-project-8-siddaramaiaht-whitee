class Stopper{
  private PVector pos;
  private float bounciness;
  public Stopper(int x, int y, float k){
    pos = new PVector(x, y);
    bounciness = k;
  }
  public float getBounciness(){
    return bounciness; 
  }
  public void display(){
    
  }
}

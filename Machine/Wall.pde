class Wall extends Stopper{
  final int wallK = 1;
  public Wall(int x, int y, int w, int h, int s){
    super(x, y, w, h, 1, s);
  }
  public Wall(int x, int y, float[][] hit, String side, float k, int s){
    super(x, y, hit, side, k, s);
  }
  public void display(){
    super.display();
    float x = this.getPos().x;
    float y = this.getPos().y;
    if (hitbox == null && hitboxCir == null){
      int w = this.getWidth();
      int h = this.getHeight();
      fill(100);
      rect(x, y, w, h);
    }
    else if (hitbox != null){
      float minY = min(hitbox[0][1], hitbox[1][1]);
      float maxY = max(hitbox[0][1], hitbox[1][1]);
      float xOfMaxY = 0;
      float xOfMinY = 0;
      if (maxY == hitbox[0][1]){
        xOfMaxY = hitbox[0][0];
        xOfMinY = hitbox[1][0];
      }else{
        xOfMaxY = hitbox[1][0];
        xOfMinY = hitbox[0][0];
      }
      if (getCollisionSide().equals("above")){
         fill(100);
         triangle(hitbox[0][0], hitbox[0][1], hitbox[1][0], hitbox[1][1], xOfMaxY, maxY);
      }
      if (getCollisionSide().equals("bottom")){
        fill(100);
        triangle(hitbox[0][0], hitbox[0][1], hitbox[1][0], hitbox[1][1], xOfMinY, minY);
      }
    }
    else if (hitboxCir != null){
      
    }
  }
  public boolean bounce(Ball ball){
    float stopX = getPos().x;
    float stopY = getPos().y;
    return super.bounce(ball, stopX, stopY, "rect");
  }
}

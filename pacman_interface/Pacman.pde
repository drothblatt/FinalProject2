class Pacman {
  
  float start=0.785;
  float stop =5.497;
  float incr = .03 ;
  
  
  private float x, y;
  public float r;
  private color c;
  private float dir;
  
 

  public Pacman(float x, float y) {
    r = 17;
    this.x = x;
    this.y = y;
    c = color(255, 204, 0);
  } 
  public void randomColor() {
    c = color(random(255), random(255), random(255));
  }
  
  public void draw() {
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);
    
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  public void setX(float newx) {
    x = newx;
  }
  public void setY(float newy) {
    y = newy;
  }
  
}





class Dot {
  private final float x, y; 
  private final int r;
  private final int value; 
  private final boolean makesGhostsEatable;

  public Dot(float x, float y) {
    this.x = x;
    this.y = y;
    value = 10; 
    r = 4; 
    makesGhostsEatable = false;
  }


  void draw() {
    stroke(255);
    fill(255);
    ellipse(x, y, r, r);
  }
<<<<<<< HEAD
  
  public String toString(){
     return ("Dot @ (" + x + "," + y + ")" ); 
  }
}
  
  
  /*
class superDot extends Dot{
  public superDot(float x, float y){
    this.x = x;
    this.y = y;
    value = 50;
    r = 8; 
    makesGhostsEatable = true;
=======

  public String toString() {
    return ("Dot @ (" + x + "," + y + ")" );
>>>>>>> 912a27bcf7f53d2f5b65ec47fe9ec66da150ef79
  }
}


/*
class superDot extends Dot{
 public superDot(float x, float y){
 this.x = x;
 this.y = y;
 value = 50;
 r = 8; 
 makesGhostsEatable = true;
 }
 }
 
 */

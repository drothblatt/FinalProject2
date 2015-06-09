class Pacman {
  
  float start=0.785;
  float stop =5.497;
  float incr = .03 ;
  
  int dir = 0;
  
  private float x, y;
  public float r;
  private color c;
  private int score; 
 

  public Pacman(float x, float y) {
    r = 16;
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

  public void move(){
     if ( dir==1 ){
       y = y - 2.5;
     } 
     if ( dir == 2 ){
       y = y +2.5;
     }
     if ( dir == 3 ){
       x = x - 2.5;
     }
     if ( dir == 4 ){
       x = x +2.5;
     }
  }
  
  public int getScore(){
    return score;
  }

  public float getX(){
     return x; 
  }
  
    public float getY(){
     return y; 
    }
  
  public void setDirection(int i){
      dir = i;
  }
  
  public String toString(){
     return ("Dot @ (" + x + "," + y + ")" ); 
  }
}





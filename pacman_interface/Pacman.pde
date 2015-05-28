class Pacman {
  
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
  
  public void draw() {
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);    
  }

  public void move(){
    if (inBounds(x,y)){
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
  }
  
  public boolean inBounds(float x, float y){
    if (dir==1){
        return (( y - 2.5 ) - 10)/20 >=1;
    }else
    if (dir==2){
        return (( y + 2.5 ) - 10)/20<=31;
    }else
    if (dir==3){
        return (( x - 2.5 ) - 10)/20>=1;
    }else
    if (dir==4){
        return (( x + 2.5 ) - 10)/20<=28;
    }else{
      return false;
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
  
}





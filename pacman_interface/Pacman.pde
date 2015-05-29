class Pacman {
  
  private float dir = 0;
  private float arcChanges = 0;
  private final float THREE_HALF_PI = HALF_PI + PI;
  private boolean closingMouth = true;
  
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
    noStroke();
    fill(c);
    
    // DETERMINE PACMAN SHAPE //
    if (dir == 0){
      ellipse(x, y, r*2, r*2);
    } else{
      arc(x, y, r*2, r*2, PI/6 - arcChanges*(PI/24) + dir, (11*PI)/6 + arcChanges*(PI/24) + dir);
    }
    
    // MOVING MOUTH CODE // 
    if (closingMouth){
      arcChanges++;
      if (arcChanges == 4){
        closingMouth = false;
      }
    } else {
      arcChanges--;
      if (arcChanges == 0){
        closingMouth = true;
      }
    }
    
    // END OF MOVING MOUTH CODE // 
    
  }

  public void move(){
    if (inBounds(x,y)){
     if ( dir == 3*HALF_PI ){
       y = y - 2.5;
     } 
     if ( dir == HALF_PI ){
       y = y + 2.5;
     }
     if ( dir == PI ){
       x = x - 2.5;
     }
     if ( dir == TWO_PI ){
       x = x +2.5;
     }
    }
  }
  
  public boolean inBounds(float x, float y){
    if (dir== 3*HALF_PI){
        return (( y - 2.5 ) - 10)/20 >=1;
    }else
    if (dir== HALF_PI){
        return (( y + 2.5 ) - 10)/20<=31;
    }else
    if (dir== PI){
        return (( x - 2.5 ) - 10)/20>=1;
    }else
    if (dir== TWO_PI){
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
  
  public void setDirection(float i){
      dir = i;
  }
  
}





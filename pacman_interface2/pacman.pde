class Pacman {
  
  private float dir = 0, nextDir; // DIRECTION VARIABLE (0, 
  private float arcChanges = 0;
  private boolean closingMouth = true;
  private NodeMap nodeMap;
  private Node currNode;
  
  private float x, y;
  public final float r;
  private final color c;
  private int score;
 
  private static final float UP =  3*HALF_PI;
  private static final float DOWN =  HALF_PI;
  private static final float LEFT =  PI;
  private static final float RIGHT =  TWO_PI;
 

  public Pacman(float x, float y) {
    r = 16;
    this.x = x;
    this.y = y;
    c = color(255, 204, 0);
    nodeMap = new NodeMap();
    currNode = nodeMap.nodeGrid[(int)y/20-1][(int)x/20-1];
  } 
  
  public void draw() {
    noStroke();
    fill(c);
    
    if (nextDir == 0){
      ellipse(x, y, r*2, r*2);
    }
    
    // PACMAN SHAPE //
    if (dir > 0) {
      arc(x, y, r*2, r*2, PI/6 - arcChanges*(PI/24) + dir, (11*PI)/6 + arcChanges*(PI/24) + dir);
    } else {
      arc(x, y, r*2, r*2, PI/6 + nextDir, (11*PI)/6 + nextDir);
    }
    
    // MOVING MOUTH //  ** similar something I found on OpenProcessing, but my own version
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
    //if (inBounds(x,y))
    
    if (x == 40 && y == 310){
       x = 560;
    } else if (x == 560 && y == 310) {
       x = 40;
    }
    
    if (nextDir == dir + PI || nextDir == dir - PI) {
      dir = nextDir;
    }
    if (currNode.getX() == x && currNode.getY() == y) {
      if (nextDir == UP && currNode.getUp() != null) {
        dir = UP;
      }
      if (nextDir == DOWN && currNode.getDown() != null) {
        dir = DOWN;
      }
      if (nextDir == LEFT && currNode.getLeft() != null) {
        dir = LEFT;
      }
      if (nextDir == RIGHT && currNode.getRight() != null) {
        dir = RIGHT;
      }
    }
    
    if ( dir == UP && ((currNode.getUp() == null && currNode.getY() != y) || currNode.getUp() != null)){
      y = y - 2.5;
    } 
    else if ( dir == DOWN &&  ((currNode.getDown() == null && currNode.getY() != y) || currNode.getDown() != null)){
      y = y + 2.5;
    }
    else if ( dir == LEFT && ((currNode.getLeft() == null && currNode.getX() != x) || currNode.getLeft() != null)){
      x = x - 2.5;
    }
    else if ( dir == RIGHT && ((currNode.getRight() == null && currNode.getX() != x) || currNode.getRight() != null)){
      x = x + 2.5;
    }
    else {
      dir = 0;
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
  
  public void setScore(int points){
    score = points;
  }

  public float getX(){
     return x; 
  }
  
  public float getY(){
     return y; 
    }
  
  public void setNextDirection(float i){
    nextDir = i;
  }
  
  public void updateCurrentNode() {
    currNode = nodeMap.nodeGrid[(int)y/20-1][(int)x/20-1];
    currNode.removeDot();
    /*System.out.println(currNode);
    System.out.println("(" + currNode.getX() + "," + currNode.getY() + ")");
    System.out.println("(" + x + "," + y + ")");*/
  }
  
}





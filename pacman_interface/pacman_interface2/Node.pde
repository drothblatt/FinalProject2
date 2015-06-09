class Node {
  
  private Node right, left, down, up;
  private int x, y;
  boolean hasDot;
  boolean hasBigDot;
  
  public Node(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    hasDot=true;
    
    if ( (xcor-30)/20 == 1 && (ycor-30)/20 == 3 ){
      hasBigDot=true;
    }else if ( (xcor-30)/20 == 1 && (ycor-30)/20 == 23 ){
      hasBigDot=true;
    }else if ( (xcor-30)/20 == 26 && (ycor-30)/20 == 3 ){
      hasBigDot=true;
    }else if ( (xcor-30)/20 == 26 && (ycor-30)/20 == 23 ){
      hasBigDot=true;
    }else{
      hasBigDot=false;
    }
  }
  
  void draw(){
    fill(255);
    smooth();
    if ( hasBigDot ){
      ellipse(x, y, 8, 8);
    }else{
      ellipse(x, y, 3, 3);
    }
  }
  
  
  public int getX() {return x;}
  public int getY() {return y;}
  
  public Node getRight() {return right;}
  public Node getLeft() {return left;}
  public Node getDown() {return down;}
  public Node getUp() {return up;}
  
  public void setRight(Node newRight) {
    right = newRight;
  }
  public void setLeft(Node newLeft) {
    left = newLeft;
  }
  public void setDown(Node newDown) {
    down = newDown;
  }
  public void setUp(Node newUp) {
    up = newUp;
  }
  
  public String toString() {
    return "(" + (x-30)/20 + "," + (y-30)/20 + ") ";
  }
  
  public boolean hasDot(){
    return hasDot;
  }
  
  public boolean hasBigDot(){
    return hasBigDot;
  }
}

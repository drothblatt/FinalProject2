class Node {
  
  private Node right, left, down, up;
  private int x, y;
  
  public Node(int xcor, int ycor) {
    x = xcor;
    y = ycor;
  }
  
  void draw(){
    fill(255);
    smooth();
    ellipse(x, y, 3, 3);
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
    return "(" + x + "," + y + ") ";
  }
  
}

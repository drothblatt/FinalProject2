class Node {

  private Node right, left, down, up;
  private int x, y;
  boolean hasDot;
  boolean hasBigDot;
  int dotVal;

  public Node(int xcor, int ycor) {
    x = xcor;
    y = ycor;
    hasDot=true;

    if ( (xcor-30)/20 == 1 && (ycor-30)/20 == 3 ) {
      dotVal = 50;
      hasBigDot=true;
    } else if ( (xcor-30)/20 == 1 && (ycor-30)/20 == 23 ) {
      dotVal = 50;
      hasBigDot=true;
    } else if ( (xcor-30)/20 == 26 && (ycor-30)/20 == 3 ) {
      dotVal = 50;
      hasBigDot=true;
    } else if ( (xcor-30)/20 == 26 && (ycor-30)/20 == 23 ) {
      dotVal = 50;
      hasBigDot=true;
    } else {
      dotVal = 10;
      hasBigDot=false;
    }

    if ( ycor == 490 && ( xcor == 310 || xcor == 290 ) ) {
      hasDot=false;
    }

    if ( ycor <= 410 && ycor >= 210 && xcor >= 170 && xcor <= 430) {
      hasDot=false;
    }

    if (ycor == 310 && (x < 150 || x > 450) ) {
      hasDot=false;
    }
  }

  void draw() {
    fill(255);
    smooth();
    if ( hasBigDot ) {
      ellipse(x, y, 8, 8);
    } else {
      ellipse(x, y, 3, 3);
    }
  }


  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

  public boolean hasUp() {
    return up != null;
  }
  public boolean hasLeft() {
    return left != null;
  }
  public boolean hasRight() {
    return right != null;
  }
  public boolean hasDown() {
    return down != null;
  }

  public Node getRight() {
    return right;
  }
  public Node getLeft() {
    return left;
  }
  public Node getDown() {
    return down;
  }
  public Node getUp() {
    return up;
  }

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
    return "(" + (y-30)/20 + "," + (x-30)/20 + ") ";
  }

  public boolean hasDot() {
    return hasDot;
  }

  public void setDot(boolean b) {
    hasDot=b;
  }

  public boolean hasBigDot() {
    return hasBigDot;
  }

  public int getVal() {
    return dotVal;
  }

  public float square(float i) {
    return i*i;
  }
}


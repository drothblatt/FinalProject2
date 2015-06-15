private class Coord {
  int x, y, size;
  float priority;
  Coord prev;

  public Coord( int x, int y, Coord prev, float priority) {
    this.x=x;
    this.y=y;
    this.prev=prev;
    this.priority = priority;
    if (prev != null) {
      size=prev.getSize()+1;
    }else {
      size = 0;
    }
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public Coord getPrev() {
    return prev;
  }

  public int getSize() {
    return size;
  }

  public String toString() {
    return "["+getX()+","+getY()+"]";
  }
  
  public float getPriority() {
    return priority;
  }
}


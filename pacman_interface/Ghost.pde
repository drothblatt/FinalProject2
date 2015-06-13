abstract class Ghost {
  final color c; 
  float x, y;
  boolean isEatable;
  Pacman pacman;
  NodeMap nodeMap;
  Node currNode, nextNode;
  int dir = 0;
  private static final float UP =  3*HALF_PI;
  private static final float DOWN =  HALF_PI;
  private static final float LEFT =  PI;
  private static final float RIGHT =  TWO_PI;

  final color BLUE = color(0, 0, 255);
  final color PINK = color(255, 51, 255);

  public Ghost(float x, float y, color c, Pacman pm, NodeMap nm) {
    this.x = x;
    this.y = y; 
    this.c = c;
    pacman = pm;
    nodeMap = nm;
    currNode = nodeMap.nodeGrid[(int)((y-30)/20)][(int)((x-30)/20)];
  }

  public abstract void move();

  public void draw() {
    fill(c);
    ellipse ( x, y, 32, 32 );
  }

  public void kill() {
    for ( int i = -16; i <= 16; i++) {
      if ( square(pacman.getX()-(x+i))+square(pacman.getY()-(y+i))<=square(16)) {
        pacman.die();
      }
    }
  }

  public float square(float i) {
    return i*i;
  }

  public void updateCurrentNode() {
    currNode = nodeMap.nodeGrid[(int)y/20-1][(int)x/20-1];
  }

  public float dist2(float x1, float x2, float y1, float y2) {
    return square(x1-x2)+square(y1-y2);
  }
}

public class Blinky extends Ghost {

  public Blinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 0, 0), pm, nm );
  } 

  public void move() {
    MazeSolver m = new MazeSolver(nodeMap.nodeGrid, currNode, pacman.currNode);
    m.solve();
    kill();
    //the first part is to find which node is closest to the pacman
    if (x == currNode.getX() && y == currNode.getY()) {
      Node next = m.nextStep();
      if (next.getX() == currNode.getUp().getX() && next.getY() == currNode.getUp().getY()) {
        dir = UP;
      }
      if (next.getX() == currNode.getDown().getX() && next.getY() == currNode.getDown().getY()) {
        dir = DOWN;
      }
      if (next.getX() == currNode.getRight().getX() && next.getY() == currNode.getRight().getY()) {
        dir = RIGHT;
      }
      if (next.getX() == currNode.getLeft().getX() && next.getY() == currNode.getLeft().getY()) {
        dir = LEFT;
      }
    }
    if ( dir == UP ) {
      y = y - 2.5;
    } else if ( dir == DOWN ) {
      y = y + 2.5;
    } else if ( dir == LEFT ) {
      x = x - 2.5;
    } else if ( dir == RIGHT ) {
      x = x + 2.5;
    }
  }

  /*public Node closest() {
   float leftDist = (float)Integer.MAX_VALUE;
   float rightDist = (float)Integer.MAX_VALUE;
   float upDist = (float)Integer.MAX_VALUE;
   float downDist = (float)Integer.MAX_VALUE;
   if (currNode.getLeft() != null) {
   leftDist = dist2(pacman.getX(), (float)currNode.getLeft().getX(), pacman.getY(), (float)currNode.getLeft().getY());
   }
   if (currNode.getRight() != null) {
   rightDist = dist2(pacman.getX(), (float)currNode.getRight().getX(), pacman.getY(), (float)currNode.getRight().getY());
   }
   if (currNode.getUp() != null) {
   upDist = dist2(pacman.getX(), (float)currNode.getUp().getX(), pacman.getY(), (float)currNode.getUp().getY());
   }
   if (currNode.getDown() != null) {
   downDist = dist2(pacman.getX(), (float)currNode.getDown().getX(), pacman.getY(), (float)currNode.getDown().getY());
   }
   float closestDist = Math.min(Math.min(leftDist, rightDist), Math.min(upDist, downDist));
   
   if (leftDist == closestDist) {
   return currNode.getLeft();
   }
   if (rightDist == closestDist) {
   return currNode.getRight();
   }
   if (upDist == closestDist) {
   return currNode.getUp();
   }
   if (downDist == closestDist) {
   return currNode.getDown();
   }
   return null;
   }*/
}


public class Inky extends Ghost {

  public Inky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(0, 0, 255), pm, nm );
  } 

  public void move() {
    kill();
  }
}

public class Clyde extends Ghost {

  public Clyde(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 128, 0), pm, nm );
  } 

  public void move() {
    kill();
  }
}

public class Pinky extends Ghost {

  public Pinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 200, 200), pm, nm );
  } 

  public void move() {
    kill();
  }
}


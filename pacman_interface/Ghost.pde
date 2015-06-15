abstract class Ghost {
  final color c; 
  float x, y;
  boolean isEatable;
  Pacman pacman;
  NodeMap nodeMap;
  Node currNode, nextNode;
  float dir = 0;
  int should = 0;
  
  PImage gSprites;
  
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
    gSprites = loadImage("data/sprites.png");
    currNode = nodeMap.nodeGrid[(int)((y-30)/20)][(int)((x-30)/20)];
  }

  public abstract void move();

  public void draw() {
    fill(c);
    //ellipse ( x, y, 32, 32 );
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
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

  public void jump() {
    x = 290;
    y = 250;
  }

  public Node closest() {
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
  }

  public Node closest2(float x, float y) {
    float leftDist = (float)Integer.MAX_VALUE;
    float rightDist = (float)Integer.MAX_VALUE;
    float upDist = (float)Integer.MAX_VALUE;
    float downDist = (float)Integer.MAX_VALUE;
    if (currNode.getLeft() != null) {
      leftDist = dist2(x, (float)currNode.getLeft().getX(), y, (float)currNode.getLeft().getY());
    }
    if (currNode.getRight() != null) {
      rightDist = dist2(x, (float)currNode.getRight().getX(), y, (float)currNode.getRight().getY());
    }
    if (currNode.getUp() != null) {
      upDist = dist2(x, (float)currNode.getUp().getX(), y, (float)currNode.getUp().getY());
    }
    if (currNode.getDown() != null) {
      downDist = dist2(x, (float)currNode.getDown().getX(), y, (float)currNode.getDown().getY());
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
  }
}

public class Blinky extends Ghost {

  public Blinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 0, 0), pm, nm );
  } 

  void draw(){
    if (dir == UP){
      copy(gSprites, 2, 1, 14, 14, (int)x-15, (int)y-15, 32, 32);
    } else if (dir == DOWN){
      copy(gSprites, 42, 1, 14, 14, (int)x-15, (int)y-15, 32, 32);
    } else if (dir == LEFT){
      copy(gSprites, 82, 1, 14, 14, (int)x-15, (int)y-15, 32, 32);
    } else if (dir == RIGHT){
      copy(gSprites, 122, 1, 14, 14, (int)x-15, (int)y-15, 32, 32);
    }
    
    
  }

  public void move() {
    MazeSolver m = new MazeSolver(nodeMap.strGrid, currNode, pacman.currNode);
    //System.out.println(currNode);
    //System.out.println(pacman.currNode);
    //m.solve();
    kill();
    //the first part is to find which node is closest to the pacman
    if (x == currNode.getX() && y == currNode.getY()) {
      Node next = closest();//m.nextStep();
      if ( currNode.hasUp()) {
        if (next.getX() == currNode.getUp().getX() && next.getY() == currNode.getUp().getY()) {
          dir = UP;
        }
      }
      if ( currNode.hasDown()) {
        if (next.getX() == currNode.getDown().getX() && next.getY() == currNode.getDown().getY()) {
          dir = DOWN;
        }
      }
      if ( currNode.hasRight()) {
        if (next.getX() == currNode.getRight().getX() && next.getY() == currNode.getRight().getY()) {
          dir = RIGHT;
        }
      }
      if ( currNode.hasLeft()) {
        if (next.getX() == currNode.getLeft().getX() && next.getY() == currNode.getLeft().getY()) {
          dir = LEFT;
        }
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
}


public class Inky extends Ghost {
  Ghost blinky;
  public Inky(float x, float y, Pacman pm, NodeMap nm, Ghost blink) {
    super(x, y, color(0, 0, 255), pm, nm );
    blinky = blink;
  } 

  public void move() {
    if ( pacman.getDotsEaten()>=30 && should == 0 ) {
      jump();
      should ++;
    }
    kill();
    Node next = null;
    float newX; 
    float newY;
    if ( x == currNode.getX() && y == currNode.getY() && should > 0) {
      try {
        if ( pacman.dir == UP ) {
          newX = 2 * pacman.getX() - blinky.getX();
          newY = 2 * (pacman.currNode.getUp().getUp().getY()) - blinky.getY();
          next = closest2(newX, newY);
        } else if ( pacman.dir == DOWN ) {
          newX = 2 * pacman.getX() - blinky.getX();
          newY = 2 * (pacman.currNode.getDown().getDown().getY()) - blinky.getY();
          next = closest2(newX, newY);
        } else if ( pacman.dir == LEFT ) {
          newX = 2 * ( pacman.currNode.getLeft().getLeft().getX()) - blinky.getX();
          newY = 2 * pacman.getY() - blinky.getY();
          next = closest2(newX, newY);
        } else {
          newX = 2 * ( pacman.currNode.getRight().getRight().getX()) - blinky.getX();
          newY = 2 * pacman.getY() - blinky.getY();
          next = closest2(newX, newY);
        }
        if ( currNode.hasUp()) {
          if (next.getX() == currNode.getUp().getX() && next.getY() == currNode.getUp().getY()) {
            dir = UP;
          }
        }
        if ( currNode.hasDown()) {
          if (next.getX() == currNode.getDown().getX() && next.getY() == currNode.getDown().getY()) {
            dir = DOWN;
          }
        }
        if ( currNode.hasRight()) {
          if (next.getX() == currNode.getRight().getX() && next.getY() == currNode.getRight().getY()) {
            dir = RIGHT;
          }
        }
        if ( currNode.hasLeft()) {
          if (next.getX() == currNode.getLeft().getX() && next.getY() == currNode.getLeft().getY()) {
            dir = LEFT;
          }
        }
      }
      catch(Exception e) {
      }
    }
    if (x == 30 && y == 310) {
      x = 570;
    } else if (x == 570 && y == 310) {
      x = 30;
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
}


public class Clyde extends Ghost {

  public Clyde(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 128, 0), pm, nm );
  } 

  public void move() {
    if ( nodeMap.totDots - pacman.getDotsEaten() <= nodeMap.totDots/3 && should == 0 ) {
      jump();
      should ++;
    }
    kill();
  }
}

public class Pinky extends Ghost {

  public Pinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 200, 200), pm, nm );
  } 

  public void move() {
    if ( should == 0 ) {
      jump();
      should ++;
    }
    kill();
  }
}


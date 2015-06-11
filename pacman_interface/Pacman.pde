import java.util.*;
import ddf.minim.*;
class Pacman {

  private float dir = 0, nextDir = 0; // DIRECTION VARIABLE (0, 
  private float arcChanges = 0;
  private boolean closingMouth = true;
  private Node currNode;

  private float x, y;
  public final float r;
  private final color c;
  private int score;
  private int lives;

  private static final float UP =  3*HALF_PI;
  private static final float DOWN =  HALF_PI;
  private static final float LEFT =  PI;
  private static final float RIGHT =  TWO_PI;

  public Pacman(float x, float y, NodeMap nodeMap) {
    r = 16;
    this.x = x;
    this.y = y;
    c = color(255, 204, 0);
    currNode = nodeMap.nodeGrid[(int)y/20-1][(int)x/20-1];
    lives = 2;
  } 

  public void draw() {
    noStroke();
    fill(c);

    // PACMAN SHAPE //

    if (nextDir == 0) {
      ellipse(x, y, r*2, r*2);
    }

    if (dir > 0) {
      arc(x, y, r*2, r*2, PI/6 - arcChanges*(PI/24) + dir, (11*PI)/6 + arcChanges*(PI/24) + dir);
    } else if (dir == 0) {
      arc(x, y, r*2, r*2, PI/6 + nextDir, (11*PI)/6 + nextDir);
    } 

    // END OF PACMAN SHAPE CODE //

    // MOVING MOUTH //  ** similar something I found on OpenProcessing, but my own version
    if (closingMouth) {
      arcChanges++;
      if (arcChanges == 4) {
        closingMouth = false;
      }
    } else {
      arcChanges--;
      if (arcChanges == 0) {
        closingMouth = true;
      }
    }

    // END OF MOVING MOUTH CODE // 
    textSize(40);
    text("LIVES", 40, 680);
    for ( int i = 0; i < lives; i ++ ) {
      arc(160+(i*40), 665, r*2, r*2, 5*PI/4, 11*PI/4);
    }
    text("SCORE:", 300, 680);
    text(score, 450, 680 );
  }

  public boolean move() {
    //if (inBounds(x,y))
    boolean ret = false;
    if (nextDir == dir + PI || nextDir == dir - PI) {
      dir = nextDir;
    }
    if (dir == UP && currNode.getUp() != null ) {
      eat(currNode.getUp());
    }
    if (dir == LEFT && currNode.getLeft() != null ) {
      eat(currNode.getLeft());
    }
    if (dir == RIGHT && currNode.getRight() != null ) {
      eat(currNode.getRight());
    }
    if (dir == DOWN && currNode.getDown() != null ) {
      eat(currNode.getDown());
    }
    if (currNode.getX() == x && currNode.getY() == y) {
      /*if (currNode.hasDot()) {
       score+=currNode.getVal();   
       currNode.setDot(false);
       ret = true;
       }*/
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
    if (x == 30 && y == 310) {
      x = 570;
    } else if (x == 570 && y == 310) {
      x = 30;
    }
    if ( dir == UP && ((currNode.getUp() == null && currNode.getY() != y) || currNode.getUp() != null)) {
      y = y - 2.5;
    } else if ( dir == DOWN &&  ((currNode.getDown() == null && currNode.getY() != y) || currNode.getDown() != null)) {
      y = y + 2.5;
    } else if ( dir == LEFT && ((currNode.getLeft() == null && currNode.getX() != x) || currNode.getLeft() != null)) {
      x = x - 2.5;
    } else if ( dir == RIGHT && ((currNode.getRight() == null && currNode.getX() != x) || currNode.getRight() != null)) {
      x = x + 2.5;
    } else {
      dir = 0;
    }
    return ret;
  }

  public float square(float i) {
    return i*i;
  }

  public void eat(Node n) {
    if ( square(n.getX() - x ) + square(n.getY() - y ) <= square(16) ) {
      if (n.hasDot()) {
        score += n.getVal();
        n.setDot(false);
      }
    }
  }
  public boolean inBounds(float x, float y) {
    if (dir== 3*HALF_PI) {
      return (( y - 2.5 ) - 10)/20 >=1;
    } else
      if (dir== HALF_PI) {
      return (( y + 2.5 ) - 10)/20<=31;
    } else
      if (dir== PI) {
      return (( x - 2.5 ) - 10)/20>=1;
    } else
      if (dir== TWO_PI) {
      return (( x + 2.5 ) - 10)/20<=28;
    } else {
      return false;
    }
  }

  public void setScore(int points) {
    score = points;
  }

  public int getScore() {
    return score;
  }

  public int getLives() {
    return lives;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void setNextDirection(float i) {
    nextDir = i;
  }

  public void die() {
    lives--;
    x = 310;
    y = 490;
    updateCurrentNode();
  }

  public void updateCurrentNode() {
    currNode = nodeMap.nodeGrid[(int)y/20-1][(int)x/20-1];
    /*System.out.println(currNode);
     System.out.println("(" + currNode.getX() + "," + currNode.getY() + ")");
     System.out.println("(" + x + "," + y + ")");*/
  }
}


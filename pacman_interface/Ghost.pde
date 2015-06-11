abstract class Ghost {
  final color c; 
  float x, y;
  boolean isEatable;
  Pacman pacman;
  NodeMap nodeMap;
  Node currNode, nextNode;
  int dir = 0;

  final color BLUE = color(0, 0, 255);
  final color PINK = color(255, 51, 255);

  public Ghost(float x, float y, color c, Pacman pm, NodeMap nm) {
    this.x = x;
    this.y = y; 
    this.c = c;
    pacman = pm;
    nodeMap = nm;
    currNode = nodeMap.nodeGrid[(int)((y-30)/20)][(int)((x-30)/20)];
    //System.out.println((int)((y-30)/20)+","+(int)(x-30)/20);
    //System.out.println(nodeMap.nodeGrid[(int)(y-30)/20][(int)(x-30)/20]);
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
    /*System.out.println(currNode);
     System.out.println("(" + currNode.getX() + "," + currNode.getY() + ")");
     System.out.println("(" + x + "," + y + ")");*/
  }
}

public class Blinky extends Ghost {

  public Blinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 0, 0), pm, nm );
  } 

  public void move() {
    kill();
    //the first part is to find which node is closest to the pacman
    if ( currNode.getX() == x && currNode.getY() == y ) {
      Node[] nodes = new Node[4];
      Node closest;
      if (currNode.hasUp()) {
        nodes[0]=currNode.getUp();
      }
      if (currNode.hasLeft()) {
        nodes[1]=currNode.getLeft();
      }
      if (currNode.hasRight()) {
        nodes[2]=currNode.getRight();
      }
      if (currNode.hasDown()) {
        nodes[3]=currNode.getDown();
      }
      float dist = Integer.MAX_VALUE;
      for ( Node n : nodes ) {
        if ( n != null ) {
          float nn = n.dist2( pacman.getX(), x, pacman.getY(), y);
          if ( nn < dist ) {
            dist = nn;
            currNode = n;
          }
        }
      }
    } else {
    }
  }
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
  


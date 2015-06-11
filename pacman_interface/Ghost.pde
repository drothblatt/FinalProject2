abstract class Ghost {
  final color c; 
  float x, y;
  boolean isEatable;
  Pacman pacman;
  NodeMap nodeMap;
  Node currNode;

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
}

public class Blinky extends Ghost {

  public Blinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 0, 0), pm, nm );
  } 

  public void move() {
  }
}

public class Inky extends Ghost {

  public Inky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(0, 0, 255), pm, nm );
  } 

  public void move() {
  }
}

public class Clyde extends Ghost {

  public Clyde(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 128, 0), pm, nm );
  } 

  public void move() {
  }
}

public class Pinky extends Ghost {

  public Pinky(float x, float y, Pacman pm, NodeMap nm) {
    super(x, y, color(255, 200, 200), pm, nm );
  } 

  public void move() {
  }
}


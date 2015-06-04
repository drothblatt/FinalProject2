abstract class Ghost {
  final color c; 
  float x, y;
  boolean isEatable;
  Pacman pacman;
  NodeMap nodeMap;

  final color BLUE = color(0, 0, 255);
  final color PINK = color(255, 51, 255);

  public Ghost(float x, float y, color c, Pacman pm, NodeMap nm) {
    this.x = x;
    this.y = y; 
    this.c = c;
    pacman = pm;
    nodeMap = nm;
  }

  public abstract void move();

  public void draw() {
    fill(c);
    ellipse ( x, y, 32, 32 );
  }
}


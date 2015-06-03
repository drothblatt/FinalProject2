class Ghost {
  final PImage img;
  final color c; 
  float x, y;
  boolean isEatable;

  final color RED = color(255, 0, 0);
  final color BLUE = color(0, 0, 255);
  final color PINK = color(255, 51, 255);
  final color ORANGE = color(255, 128, 0);

  public Ghost(float x, float y, color c) {
    this.x = x;
    this.y = y; 
    this.c = c;
    if (c == RED) {
      img = loadImage("blinky.jpg");
    } else if ( c == PINK) {
      img = loadImage("pinky.jpg");
    } else if ( c == BLUE) {
      img = loadImage("inky.jpg");
    } else if ( c == ORANGE) {
      img = loadImage("clyde.jpg");
    } else {
      img = loadImage("blinky.jpg");
    }
  }

  void draw() {
    image(img, x, y);
  }
}


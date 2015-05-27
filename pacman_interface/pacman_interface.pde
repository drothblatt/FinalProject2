
Pacman pacman;
Ghost blinky, pinky, inky, clyde; 

boolean keyUp, keyDown, keyLeft, keyRight, keySpace, keySpaceReleased;
PImage map; 

int xPos= -50;
float start=0.785;  
float stop =5.497;
float incr = .03 ;

final color RED = color(255, 0, 0);
final color BLUE = color(0, 0, 255);
final color PINK = color(255, 51, 255);
final color ORANGE = color(255, 128, 0);

void setup(){
   size(650,750);
   background(0);
   map = loadImage("map.jpg");
   pacman = new Pacman(width/2.0 - 63.5, height/2.0 + 14);
   blinky = new Ghost(300, height/2.0, RED);
   pinky = new Ghost(330, height/2.0, PINK);
   inky = new Ghost(350, height/2.0, BLUE);
   clyde = new Ghost(380, height/2.0, ORANGE);
}

void draw(){
  background(0);
  image(map, 20, 20);
  pacman.draw();
  fill(0);
  processKeys();
  
  stroke(255);
  for (int i = 20; i < 620; i += 20){
     line(i, 20, i, 580);
  }
  for (int j = 20; j < 580; j += 20){
     line(20, j, 640, j);
  }
}
  
void processKeys() {
  if (keyUp) {
    pacman.setY(pacman.getY()- 2.5);
  }
  if (keyDown) {
    pacman.setY(pacman.getY() + 2.5);
  } 
  if (keyLeft) {
    pacman.setX(pacman.getX() - 2.5);
  }
  if (keyRight) {
    pacman.setX(pacman.getX() + 2.5);
  }
  if (keySpace && keySpaceReleased) {
    keySpaceReleased = false; 
    pacman.randomColor();
  }
}

void keyReleased() {
  if (keyCode == 32) { // SPACE
    keySpace = false;
    keySpaceReleased = true;
  }
  if (keyCode == 38) { // UP
    keyUp = false;
  }
  if (keyCode == 40) { // DOWN 
    keyDown = false;
  }
  if (keyCode == 37) { // LEFT
    keyLeft = false;
  }
  if (keyCode == 39) { // RIGHT
    keyRight = false;
  }
}

void keyPressed() {
  print (keyCode + " " + "\n");
  if (keyCode == 32) { // SPACE
    keySpace = true;
    keyUp = false;
    keyDown = false;
    keyLeft = false;
    keyRight = false;
  }
  if (keyCode == 38) { // UP
    keyUp = true;
    keySpace = false;
    keyDown = false;
    keyLeft = false;
    keyRight = false;
  }
  if (keyCode == 40) { // DOWN 
    keyDown = true;
    keySpace = false;
    keyUp = false;
    keyLeft = false;
    keyRight = false;
  }
  if (keyCode == 37) { // LEFT
    keyLeft = true;
    keySpace = false;
    keyUp = false;
    keyDown = false;
    keyRight = false;
  }
  if (keyCode == 39) { // RIGHT
    keyRight = true;
    keyLeft = false;
    keySpace = false;
    keyUp = false;
    keyDown = false;

  }
}
    
  /*  
  stroke(255,204,0);  
  line(0,20, 700, 20);
  line(0,717 , 700, 717);
  line(20, 0, 20, 800);
  line(650, 0, 650, 800);
  */





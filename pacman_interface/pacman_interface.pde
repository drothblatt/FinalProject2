import java.util.*;

Pacman pacman;
Ghost blinky, pinky, inky, clyde; 
Dot[] dots;
Dot d1, d2, d3, d4;

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
   pacman = new Pacman(300, 370);
   dots = new Dot[244];
   populateDots();

   
   /*
   blinky = new Ghost(300, height/2.0, RED);
   pinky = new Ghost(330, height/2.0, PINK);
   inky = new Ghost(350, height/2.0, BLUE);
   clyde = new Ghost(380, height/2.0, ORANGE);
   */
   



}

void draw(){
  background(0);
  image(map, 20, 20);
  pacman.draw();
  for (int i = 0; i < dots.length; i++){
    if (dots[i] != null){
      (dots[i]).draw();
    }
  }
  
  fill(0);
  processKeys();
  
  stroke(255);
  
  for (int i = 20; i <= 580; i += 20){ // vertically
     line(i, 20, i, 640);
  }
    
  for (int j = 20; j <= 640; j += 20){ // horizontally
     line(20, j, 580, j);
  }
}
  
void processKeys() {
  if (keyUp) {
    pacman.setY(pacman.getY()- 1);
  }
  if (keyDown) {
    pacman.setY(pacman.getY() + 1);
  } 
  if (keyLeft) {
    pacman.setX(pacman.getX() - 1);
  }
  if (keyRight) {
    pacman.setX(pacman.getX() + 1);
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

void mousePressed(){
  print( "(" + mouseX + "," + mouseY + ")" );
}
    
 
void populateDots(){
  int i = 0;
  for (float x = 50; x <= 270; x+=20){
    Dot d = new Dot(x, 50.0);
    dots[i] = d;
    i++;
  }
  for (float x = 330; x <= 550; x+=20){
    Dot d = new Dot(x, 50.0);
    dots[i] = d;
    i++;
  } 
  for (float y = 70; y <= 110; y += 20){
    dots[i] = new Dot(50, y);
    dots[i+1] = new Dot(150, y);
    dots[i+2] = new Dot(270, y);
    dots[i+3] = new Dot(330, y);
    dots[i+4] = new Dot(450, y);
    dots[i+5] = new Dot(550, y);
    i = i + 6;
  }
  
  
}


  /*  
  stroke(255,204,0);  
  line(0,20, 700, 20);
  line(0,717 , 700, 717);
  line(20, 0, 20, 800);
  line(650, 0, 650, 800);
  */





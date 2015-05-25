
Pacman pacman;
boolean keyUp, keyDown, keyLeft, ketRight, keySpace, keySpaceReleased;
PImage map; 

int xPos= -50;
float start=0.785;  
float stop =5.497;
float incr = .03 ;

void setup(){
   size(800,800);
   background(0);
   map = loadImage("map.jpg");
   pacman = new Pacman(width/2.0 - 63, height/2.0 + 14);
}

void draw(){
  background(0);
  image(map, 20, 20);
  pacman.draw();
  fill(0);
  processKeys();
}
  
void processKeys() {
  if (keyUp) {
    pacman.setY(pacman.getY()-2.0);
  }
  if (keySpace && keySpaceReleased) {
    keySpaceReleased = false; 
    //don't do this again until you release it
    //player.randomColor();
  }
}

void keyReleased() {
  if (keyCode == 32) {//space
    keySpace = false;
    keySpaceReleased = true;
  }
  if (keyCode == 38) {//up
    keyUp = false;
  }
}

void keyPressed() {
  if (keyCode == 32) {//space\
    keySpace = true;
  }
  if (keyCode == 38) {//up
    keyUp = true;
  }
}
    
  /*  
  stroke(255,204,0);  
  line(0,20, 700, 20);
  line(0,717 , 700, 717);
  line(20, 0, 20, 800);
  line(650, 0, 650, 800);
  */





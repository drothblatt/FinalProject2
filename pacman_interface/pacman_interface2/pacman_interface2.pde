import java.util.*;

Pacman pacman;
NodeMap nodeMap;
boolean keyUp, keyDown, keyLeft, keyRight, keySpace;
PImage map;

void setup(){
   size(650,750);
   background(0);
   map = loadImage("map.jpg");   
   pacman = new Pacman(300, 370);
   nodeMap = new NodeMap();
}

void draw(){
  background(0);
  image(map, 20, 20);
  pacman.move();
  pacman.draw();
  
  fill(0);
  stroke(255);
  
  for (int i = 20; i <= 580; i += 20){ // vertically
     line(i, 20, i, 640);
  }
    
  for (int j = 20; j <= 640; j += 20){ // horizontally
     line(20, j, 580, j);
  }
}

void keyPressed(){
    if (keyCode==38){
        pacman.setDirection(1);//up        
    }
    if (keyCode==40){
        pacman.setDirection(2);//down        
    }
    if (keyCode==37){
        pacman.setDirection(3);//left        
    }
    if (keyCode==39){
        pacman.setDirection(4);//right        
    }
}  


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
   System.out.println(nodeMap);
}

void draw(){
  background(0);
  image(map, 20, 20);
  // DOTS // 
  for (int i = 0; i < 31; i++ ){
    for (int j = 0; j < 28; j++ ){
      if (nodeMap.nodeGrid[i][j] != null){
        (nodeMap.nodeGrid[i][j]).draw();
      }
    }
  }
  
  // PACMAN // 
  pacman.move();
  pacman.draw();
  //theGrid();
  
  // GRID // 
  
  fill(0);
  stroke(255);
  for (int i = 20; i <= 580; i += 20){ // vertically
     line(i, 20, i, 640);
  }
    
  for (int j = 20; j <= 640; j += 20){ // horizontally
     line(20, j, 580, j);
  }
}

void theGrid(){
    for ( int i = 0 ; i <  nodeMap.strGrid[0].length; i++){
       for ( int j = 0 ; j < nodeMap.strGrid.length; j++ ){
         if (nodeMap.strGrid[j][i]!=null){
          textSize(20);
          text(nodeMap.strGrid[j][i],i*20+20,j*20+40);
          fill(255, 255, 255);
         }
       }   
    }
}

void keyPressed(){
    if (keyCode==38){
        pacman.setDirection( 3*HALF_PI );//up        
    }
    if (keyCode==40){
        pacman.setDirection( HALF_PI);//down        
    }
    if (keyCode==37){
        pacman.setDirection( PI );//left        
    }
    if (keyCode==39){
        pacman.setDirection( TWO_PI );//right        
    }
}  


import java.util.*;
import ddf.minim.*;

Pacman pacman;
NodeMap nodeMap;
<<<<<<< HEAD
boolean keyUp, keyDown, keyLeft, keyRight, keySpace;
PImage map;

void setup(){
   size(650,750);
   background(0);
   map = loadImage("map.jpg");   
   pacman = new Pacman(310, 370);
   nodeMap = new NodeMap();
   //System.out.println(nodeMap);
}
=======
PImage map;
AudioPlayer player;
AudioPlayer player2;
Minim minim, minim2;
int moves = 0;
Ghost[] ghosts = { 
  new Blinky( 300, 251, pacman, nodeMap ), 
  new Clyde ( 340, 308, pacman, nodeMap ), 
  new Inky ( 260, 308, pacman, nodeMap ), 
  new Pinky ( 300, 308, pacman, nodeMap )
  };

  void setup() {
    size(650, 750);
    background(0);
    map = loadImage("map.jpg");   
    nodeMap = new NodeMap();
    pacman = new Pacman(310, 490, nodeMap);
    //System.out.println(nodeMap);
    minim = new Minim(this);
    minim2 = new Minim(this);
    player = minim.loadFile("Pacman Opening Song.mp3");
    player2 = minim.loadFile("Pacman Waka Waka.mp3");
    player.play();
    draw();
    try {
      Thread.sleep(3800);
    }
    catch(Exception e) {
      System.out.println("nope");
    }
    player = minim.loadFile("Pacman Siren.mp3");
    player.loop();
    frameRate(40);
  }

>>>>>>> 912a27bcf7f53d2f5b65ec47fe9ec66da150ef79

void draw() {
  background(0);
  image(map, 20, 20);
  // DOTS // 
<<<<<<< HEAD
  for (int i = 0; i < 31; i++ ){
    for (int j = 0; j < 28; j++ ){
      if (nodeMap.nodeGrid[i][j] != null && nodeMap.nodeGrid[i][j].hasDot()){
=======
  for (int i = 0; i < 31; i++ ) {
    for (int j = 0; j < 28; j++ ) {
      if (nodeMap.nodeGrid[i][j] != null && nodeMap.nodeGrid[i][j].hasDot()) {
>>>>>>> 912a27bcf7f53d2f5b65ec47fe9ec66da150ef79
        (nodeMap.nodeGrid[i][j]).draw();
      }
    }
  }
<<<<<<< HEAD
  
  // PACMAN // 
  pacman.updateCurrentNode();
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
        pacman.setNextDirection( 3*HALF_PI );//up        
    }
    if (keyCode==40){
        pacman.setNextDirection( HALF_PI);//down        
    }
    if (keyCode==37){
        pacman.setNextDirection( PI );//left        
    }
    if (keyCode==39){
        pacman.setNextDirection( TWO_PI );//right        
    }
}  

void mouseClicked(){
=======

  for ( Ghost g : ghosts ) {
    g.draw();
  }
  // PACMAN // 
  pacman.updateCurrentNode();
  if (pacman.move()) {

    if ( moves % 8 == 0) {
      player2.play();
    }
  }
  pacman.draw();
  //theGrid();

  // GRID // 

  fill(0);
  stroke(255);
  for (int i = 20; i <= 580; i += 20) { // vertically
    line(i, 20, i, 640);
  }

  for (int j = 20; j <= 640; j += 20) { // horizontally
    line(20, j, 580, j);
  }
}

void theGrid() {
  for ( int i = 0; i <  nodeMap.strGrid[0].length; i++) {
    for ( int j = 0; j < nodeMap.strGrid.length; j++ ) {
      if (nodeMap.strGrid[j][i]!=null) {
        textSize(20);
        text(nodeMap.strGrid[j][i], i*20+20, j*20+40);
        fill(255, 255, 255);
      }
    }
  }
}

void keyPressed() {
  if (keyCode==38) {
    pacman.setNextDirection( 3*HALF_PI );//up
  }
  if (keyCode==40) {
    pacman.setNextDirection( HALF_PI);//down
  }
  if (keyCode==37) {
    pacman.setNextDirection( PI );//left
  }
  if (keyCode==39) {
    pacman.setNextDirection( TWO_PI );//right
  }
}  

void mouseClicked() {
>>>>>>> 912a27bcf7f53d2f5b65ec47fe9ec66da150ef79
  print( "(" + mouseX + "," + mouseY + ")" );
}


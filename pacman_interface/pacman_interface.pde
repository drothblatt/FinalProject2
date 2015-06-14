import java.util.*;
import ddf.minim.*;


Pacman pacman;
NodeMap nodeMap;
PImage map;
AudioPlayer player;
AudioPlayer player2;
Minim minim, minim2;
int moves;

final int PLAY = 0;
final int START_MENU = 1; 
final int PAUSE_MENU = 2;
final int END_MENU = 3;
int MODE;

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
    MODE = START_MENU; 
    moves = 0;

    //System.out.println(nodeMap);
    /*
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
    */
    //frameRate(40);
  }


void draw() {
  if (MODE == START_MENU) {
    startMenu();
  } else if (MODE == PAUSE_MENU) {
    pauseMenu();
  } else if (MODE == END_MENU) {
    endMenu();
  } else{
    background(0);
    image(map, 20, 20);
    fill(255, 204, 0);
    textSize(18);
    text("Press SPACEBAR to pause", 195, 735);

    // DOTS // 
    for (int i = 0; i < 31; i++ ) {
      for (int j = 0; j < 28; j++ ) {
        if (nodeMap.nodeGrid[i][j] != null && nodeMap.nodeGrid[i][j].hasDot()) {
          (nodeMap.nodeGrid[i][j]).draw();
        }
      }
    }

    for ( Ghost g : ghosts ) {
      g.draw();
    }
    // PACMAN // 
    pacman.updateCurrentNode();
    pacman.move();
    /*
      if ( moves % 8 == 0) {
        player2.play();
      }
    } */
    pacman.draw();
    
    if (pacman.getLives() <= 0){
      MODE = END_MENU;
    }
    
    //theGrid();

    // GRID // 

  /*
    fill(0);
    stroke(255);

    for (int i = 20; i <= 580; i += 20) { // vertically
     line(i, 20, i, 640);
     }
     
     for (int j = 20; j <= 640; j += 20) { // horizontally
     line(20, j, 580, j);
     }
     */
  }
}

void pauseMenu() {
  fill(0, 0, 0, 100);
  rect(50, 50, 500, 560);
  fill(255, 204, 0);
  textSize(18);
  text("PACMAN", 100, 100);
  text("David Rothblatt - Elias Saric - Gary Zhu", 100, 150);
  text("Score: ", 100, 225);
  text("" + pacman.getScore(), 100, 250);
  text("Lives: ", 100, 325);
  text("" + (pacman.getLives() + 1), 100, 350);
  text("Use ARROWKEYS to move", 100, 400);
  text("Press SPACEBAR to keep playing", 100, 500);
  text("Press ESC to quit", 100, 575);
}

void startMenu(){
  fill(0, 0, 0, 100);
  rect(50, 50, 500, 560);
  fill(255, 204, 0);
  textSize(18);
  text("PACMAN", 100, 100);
  textSize(12);
  text("David Rothblatt - Elias Saric - Gary Zhu", 100, 125);
  textSize(16);
  text("How To Play:", 100, 225);
  text("ARROWKEYS to move", 150, 275);
  text("SPACEBAR to pause", 150, 325);
  text("ESC to exit window", 150, 375);
  textSize(40);
  text("Press S to Start!", 100, 500);
}

void endMenu(){
  clear();
  background(0);
  fill(0, 0, 0, 100);
  rect(50, 50, 500, 560);
  fill(255, 204, 0);
  textAlign(CENTER);
  text("PACMAN", 325, 100);
  textSize(12);
  text("David Rothblatt - Elias Saric - Gary Zhu", 325, 125);
  textSize(20);
  text("GAME OVER", 325, 400);
  text("Your Options", 325, 550); 
  text("Press R: Play Again", 325, 600);
  text("Press ESC: See This Window Disappear", 325, 700);
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
  
  if (keyCode == 82){
    restart();
    MODE = PLAY;
  }
  
  if (MODE == PLAY){
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
    if (keyCode == 32){//spacebar
      MODE = PAUSE_MENU;
    }    
  } 
  else if (MODE == PAUSE_MENU){
    if (keyCode == 32){//spacebar
      MODE = PLAY;
    }    
  }
  else if (MODE == START_MENU){
    if (keyCode == 83){
      MODE = PLAY;
    }
  }
  else if (MODE == END_MENU){
    if (keyCode == 82){
      restart();
      MODE = PLAY;
    }
  }
  
}

void restart(){
  setup();
}  

void mouseClicked() {
  print( "(" + mouseX + "," + mouseY + ")" );
}


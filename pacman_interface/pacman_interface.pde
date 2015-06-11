import java.util.*;
import ddf.minim.*;

Pacman pacman;
NodeMap nodeMap;
PImage map;
AudioPlayer player;
AudioPlayer player2;
Minim minim, minim2;
int moves = 0;
int MODE = 1; 
Ghost[] ghosts;

void setup() {
  size(650, 750);
  background(0);
  map = loadImage("map.jpg");   
  nodeMap = new NodeMap();
  pacman = new Pacman(310, 490, nodeMap);
  ghosts = new Ghost[4];
  ghosts[0] = new Blinky( 290, 250, pacman, nodeMap );
  ghosts[1] = new Clyde ( 330, 310, pacman, nodeMap );
  ghosts[2] = new Inky ( 250, 310, pacman, nodeMap );
  ghosts[3] = new Pinky ( 290, 310, pacman, nodeMap );
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
  if (MODE == 0) {
    pauseMenu();
  } else {
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
    for( Ghost g : ghosts ){
      g.move();
    }
    /*
      if ( moves % 8 == 0) {
     player2.play();
     }
     } */
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
  text("Press SPACEBAR to keep playing", 100, 450);
  text("To Restart, Press 'R'", 100, 500);
  text("Press ESC to quit", 100, 575);
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
  
  if (keyCode==82){
    if (MODE == 0){
      restart();
      MODE = 1;
    }
  }

  if (keyCode == 32) { // spacebar
    if (MODE == 0) {
      MODE = 1;
    } else {
      MODE = 0;
    }
  }
}  

void mouseClicked() {
  print( "(" + mouseX + "," + mouseY + ")" );
}

void restart(){
 setup(); 
}


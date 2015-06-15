# Final Project Spring: Pacman Takes Processing
For our final project, we hope to utilize processing to create a version of Pacman that is very similar to the original. 

Team Name
=======
PacMEN


Members
=======
David Rothblatt, Elias Saric, Gary Zhu 


Goals / Plan 
=======

  - Make a pacman map that looks very similar to the original with the blue borders marking the walls and the white dots. (√)
  - Create a Pacman that (eventually) moves along the grid (the end user will not actually see the grid). Pacman should not be     able to pass through certain parts of the grid (i.e. walls). Pacman’s mouth should also be animated.  (√)
  - Implement a grid system. This will probably be done by using a 2-D array that has each element corresponding to a specific     square of pixel coordinates.	(√)
  - All walls should be in the 	same place as in the original. The player should be able to teleport 	to the other side of the     level by going through the openings in the 	left and right portions of the level.	(√)
  - Add dots to the game. There is one dot per tile on every tile Pacman can move 	at the beginning of the game. When Pacman      passes over a tile with a 	pellet, he “eats” the add, removing it from the game and 	adding 10 points to the player’s          score. We also want to implement bigger dots, worth 50 points. (√)
  - Add ghosts to the game. Each ghost has a unique AI. One ghost will directly pursue Pacman, another will try to cut Pacman      off, another will move 	randomly and so forth. If Pacman touches a ghost, a life is lost. (<i>somewhat - ghost movement is     faulty and not identical to the original </i>)
  - Keep track of and display the score and number of lives of the Pacman (√)
  - Give the big Dots the ability to change the ghosts’ state from predator to prey allowing Pacman to “eat” the ghosts upon       contact instead of being “eaten.”	(x) 
  - Add sound effects, fruit, and other minor features. (<i>some sound included</i>) 
  - The original high score/ extra lives/ fruits eaten all in the same place. (x) 



Dev Log
=======
  
  <b>5/25: </b>
    - Basic Setup: pacman_interface.pde, Pacman.pde, Ghost.pde all established with minor aspects. 
    - Playing with Key methods for Pacman movement. 
  
  <b>5/27:  </b>
    - More w/ Framework: Added blank pacman map (map.jpg) for our background. Made gridlines (31x28 w/ each square being 20x20       pixels) in order to allow us to work with nodes. 
    - Established Dot.pde to make dots. Played with dot placement and setup. 
    - Played with Key methods for Pacman movement. 
    - Basic Pacman Movement - keys don’t lead to movement, keys change direction. Movement not yet rail-based. 
    - Made grid.txt that represent places pacman/ghosts can move to and places they cannot
    - NodeMap.pde written to scan the grid.txt file and establish nodes (buggy)
    - Node.pde written; basis of our rail-system - vital for pacman/ghosts movement. 
  
  <b>5/28: </b>
    - Pacman animation completed. 
    - Progress working with Nodes.
  
  <b>5/29: </b> 
    - Complete NodeGrid issues. 
    - Nodes made (contains right, left, up, and down node references, x and y coordinates, accessor and mutator methods,             toString) thx to now working NodeGrid.pde file 
  
  <b>5/30:</b>
    - Checked the Nodes. 
    - Planned next steps. 
  
  <b>5/31:</b>
  - Got rid of Dot Class, made Dots a characteristic within Nodes, functional. 
      - hasDot and hasBigDot booleans
      - Established BigDots (worth extra points, makes ghosts eatable)
      - Dots (regular and Big) properly drawn 
  - Pacman movement improved. 
      - Pacman movement now rail-based!!! 
      - Pacman teleportation implemented. 
      - Pacman’s mouth stays open when hits a wall. 
      - Pacman now a circle at beginning as it should be. 
  
  <b>6/1:</b>
    - Pacman animation improved:
        - Pacman’s mouth stays open when hits a wall (for a short while we messed it up, but it’s good again now)
        - Point system implemented. 
        - Lives/Scoring System now displayed. 
    - Dots now eaten by Pacman
    - Altered dot placement on map so that it looks more like original. 
    - Played with sound (opening song, waka-waka).
  
  <b>6/2: </b>
    - Overall formatting improvements. 
    - Decided to follow Pacman more closely and remove the extraneous dots in the center and pathway for teleportation. 
    - Attempted to fix error where, when Pacman teleports, it leaves behind a dot that must be eaten by going back (still working     on it).
  
  <b>6/3: </b>
    - Worked more on sound. Struggled. 
    - Started work on the ghosts 
        - Basic skeletons of what we need were made today
        - Blinky, Inky, Pinky, Clyde (why break the rhyme?) all extend Ghost class
    
  <b>6/4: </b>
    - Discussed over what we should do for the ghost movement
      - No clear, solid ideas presented   
  
  <b>6/5: </b>
    - Consulted Mr.K briefly in class to clarify a few things
      - Ideas became clearer 
        - Incl. plan for speeding up the game (removing grid lines, etc.)
    - Outlined next steps. 
  
  <b>6/6: </b>
    - Worked on ghost movement, each of us tried to implement our own ghetto algorithms for ghost movement. No success. Nothing      worth committing. 
  
  <b>6/7: </b>
    - Pause menu established, functional.
    - Failed attempt at sound.
    - Very scary and disgusting violin sounds when trying to implement sound.
    - More work with ghosts.
  
  <b>6/8: </b>
    - Big catastrophe: tons of merge errors day of presentation.
  
  <b>6/9: </b>
    - Errors found were fixed with good merge.
    - Pacman can eat the dots even before the dot reaches the center of pacman.
  
  <b>6/10:</b>
    - Ghosts actually move on the grid now instead of moving on an invisible one and now lies with the pacman (although only         basic movement complete).
    - Ghosts can now kill the pacman - lives updated as you would expect/want. 
  
  <b>6/11:</b>
    - Working on ghost movement. 
    - “Ghetto” versions working; ghosts wobble back and forth.
  
  <b>6/12:</b>
    - Started doing maze solver by copy pasting.
      - Decided not to do so and wrote maze solver from scratch using MyDeque.
  
  <b>6/13:</b>
    - Worked on a type of maze solver using A star but results in white screen and bugs.
    - Menus made (start menu, end menu, new framework).
  
  <b>6/14:</b>
    - After giving up on maze solver, we used poor movement algorithms to move ghosts.
    - Worked on ghost movement and was able to get some of them working with bugs.
    - Ghost sprites implemented (eyes move, etc) - pretty cool actually. 
  
  <b>6/15:</b>
    - Finished the rest of the ghost movement because “we are the three code wizzies” - Gary
    - We completed the long and hard task of recreating a bootlegged version of our type of pacman.
    - We have one sound (two if you reach the end, which is no easy task).

How to Access Our Project?
=========
  For all versions just use processing to open the pacman_interface.pde file in the pacman_interface folder located in our       FinalProject2 repo (nothing needs to be changed or anything like that). 

  - <b>First Working Version: </b>
    - Features: Setup; Pacman Movement & Anmiation & Teleportation; Dots (although they aren't eatable just yet). 
    - working_version_1 branch:
        https://github.com/drothblatt/FinalProject2/tree/working_version_1

  - <b>Second Working Version: </b>
    - Features: Pacman now eats dots; Score & Lives are counted and displayed; Pause Menu.   
    - working_version_2 branch:
        https://github.com/drothblatt/FinalProject2/tree/working_version_2

  - <b>Third & Last Working Version:</b>
    - Features: Glitchy, Awkward Ghost Movement; Some Sound; Start/End Menus    
    - master branch
        https://github.com/drothblatt/FinalProject2


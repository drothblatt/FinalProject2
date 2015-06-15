# Final Project Spring: Pacman Takes Processing
For our final project, we hope to utilize processing to create a version of Pacman that is very similar to the original. 

Team Name
=======
PacMEN


Members
=======
David Rothblatt, Elias Saric, Gary Zhu


Dev Log
=======

5/25:
  - Basic Setup: pacman_interface.pde, Pacman.pde, Ghost.pde all established with minor aspects. 
  - Playing with Key methods for Pacman movement. 

5/27: 
  - More w/ Framework: Added blank pacman map (map.jpg) for our background. Made gridlines (31x28 w/ each square being 20x20       pixels) in order to allow us to work with nodes. 
  - Established Dot.pde to make dots. Played with dot placement and setup. 
  - Played with Key methods for Pacman movement. 
  - Basic Pacman Movement - keys don’t lead to movement, keys change direction. Movement not yet rail-based. 
  - Made grid.txt that represent places pacman/ghosts can move to and places they cannot
  - NodeMap.pde written to scan the grid.txt file and establish nodes (buggy)
  - Node.pde written; basis of our rail-system - vital for pacman/ghosts movement. 

5/28:
  - Pacman animation completed. 
  - Progress working with Nodes.

5/29:
  - Complete NodeGrid issues. 
  - Nodes made (contains right, left, up, and down node references, x and y coordinates, accessor and mutator methods,           toString) thx to now working NodeGrid.pde file 

5/30:
  - Checked the Nodes. 
  - Planned next steps. 

<b> 5/31: </b>
- Got rid of Dot Class, made Dots a characteristic within Nodes, functional. 
    - hasDot and hasBigDot booleans
    - Established BigDots (worth extra points, makes ghosts eatable)
    - Dots (regular and Big) properly drawn 
- Pacman movement improved. 
    - Pacman movement now rail-based!!! 
    - Pacman teleportation implemented. 
    - Pacman’s mouth stays open when hits a wall. 
    - Pacman now a circle at beginning as it should be. 

6/1:
Pacman animation improved:
Pacman’s mouth stays open when hits a wall (for a short while we messed it up, but it’s good again now)
Point system implemented. 
Lives/Scoring System now displayed. 
Dots now eaten by Pacman
Altered dot placement on map so that it looks more like original. 
Played with sound (opening song, waka-waka).
6/2:
Overall formatting improvements. 
Decided to follow Pacman more closely and remove the extraneous dots in the center and pathway for teleportation. 
Attempted to fix error where, when Pacman teleports, it leaves behind a dot that must be eaten by going back (still working on it).
6/3:
Worked more on sound. Struggled. 
Started work on the ghosts 
Basic skeletons of what we need were made today
Blinky, Inky, Pinky, Clyde (why break the rhyme?) all extend Ghost class
6/4:
discussion over what we should do for the ghost movement
no one has a clear idea
6/5:
Consulted Mr.K briefly in class to clarify a few things
Ideas became clearer 
Incl. plan for speeding up the game (removing grid lines, etc.)
Outlined next steps. 
6/6:
Worked on ghost movement, each of us tried to implement our own ghetto algorithms for ghost movement. No success. Nothing worth committing. 
6/7:
Pause menu established, functional.
Failed attempt at sound.
Very scary and disgusting violin sounds when trying to implement sound.
More work with ghosts.
6/8:
Big catastrophe: tons of merge errors day of presentation.
6/9:
Errors found were fixed with good merge.
Pacman can eat the dots even before the dot reaches the center of pacman.
6/10:
Ghosts actually move on the grid now instead of moving on an invisible one and now lies with the pacman (although only basic movement complete).
Ghosts can now kill the pacman - lives updated as you would expect/want. 
6/11:
Working on ghost movement. 
“Ghetto” versions working; ghosts wobble back and forth. 
6/12:
Started doing maze solver by copy pasting.
Decided not to do so and wrote maze solver from scratch using MyDeque.
6/13:
Worked on a type of maze solver using A star but results in white screen and bugs.
Menus made (start menu, end menu, new framework).
6/14:
After giving up on maze solver, we used poor movement algorithms to move ghosts.
Worked on ghost movement and was able to get some of them working with bugs.
Ghost sprites implemented (eyes move, etc) - pretty cool actually. 
6/15:
Finished the rest of the ghost movement because “we are the three code wizzies” - Gary
We completed the long and hard task of recreating a bootlegged version of our type of pacman.
We have one sound (two if you reach the end, which is no easy task).

How to Access Our Project?
=========
For all versions just use processing to open the pacman_interface.pde file in the pacman_interface folder located in our FinalProject2 repo (nothing needs to be changed or anything like that). 

First Working Version:
working_version_1 branch 
https://github.com/drothblatt/FinalProject2/tree/working_version_1

Second Working Version:
working_version_2 branch
https://github.com/drothblatt/FinalProject2/tree/working_version_2

Last Working Version:
master branch
https://github.com/drothblatt/FinalProject2


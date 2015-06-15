import java.util.*;
import java.io.*;

class NodeMap {

  Node[][] nodeGrid;
  String[][] strGrid;
  String[] lines;
  int totDots=0;

  public NodeMap() {
    strGrid = new String[31][28];
    createStringGrid();
    createNodeGrid();
    for ( int i = 0; i < nodeGrid.length; i++) {
      for ( int j = 0; j < nodeGrid[0].length; j++) {
        if (nodeGrid[i][j]!=null) {
          totDots++;
        }
      }
    }
  }

  public String toString() {
    String out = "";
    for (int i = 0; i < nodeGrid.length; i++) {
      for (int j = 0; j < nodeGrid[0].length; j++) {
        if ( nodeGrid[i][j]!=null) {
          out += nodeGrid[i][j];
        }
      }
      out += "\n";
    }
    return out;
  }

  private void createStringGrid() { // Loads the text file into a String 2d array
    try {
      lines = loadStrings("grid.txt");
      for ( int i = 0; i < lines.length; i ++ ) {
        for ( int j = 0; j < lines[i].length (); j++ ) {
          strGrid[i][j]=lines[i].substring(j, j+1);
        }
      }
    }
    catch (Exception e) {
      e.printStackTrace();
      System.out.println("File not found");
    }
  }

  private void createNodeGrid() { // Uses the String 2d array to fill in a grid
    nodeGrid = new Node[31][28];
    // Populate the node array
    for (int i = 0; i < strGrid.length; i++) {
      for (int j = 0; j < strGrid[0].length; j++) {
        if (! strGrid[i][j].equals("x")) {
          nodeGrid[i][j] = new Node(j*20+30, i*20+30);
        }
      }
    }
    // Connect nodes to their neighbors
    for (int i = 1; i < nodeGrid.length - 1; i++) {
      for (int j = 1; j < nodeGrid[0].length - 1; j++) {
        if (nodeGrid[i][j] != null) {
          Node curr = nodeGrid[i][j];
          if (nodeGrid[i-1][j] != null) {
            curr.setUp(nodeGrid[i-1][j]);
          }
          if (nodeGrid[i+1][j] != null) {
            curr.setDown(nodeGrid[i+1][j]);
          }
          if (nodeGrid[i][j-1] != null) {
            curr.setLeft(nodeGrid[i][j-1]);
          }
          if (nodeGrid[i][j+1] != null) {
            curr.setRight(nodeGrid[i][j+1]);
          }
        }
      }
    }
  }

  public Node[][] getNodeGrid() {
    return nodeGrid;
  }
}


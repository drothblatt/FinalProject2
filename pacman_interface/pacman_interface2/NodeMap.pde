import java.util.*;
import java.io.*;

class NodeMap {
  
  Node[][] nodeGrid;
  String[][] strGrid;
  String[] lines;
  
  public NodeMap() {
    strGrid = new String[31][28];
    createStringGrid();
    createNodeGrid();
  }
  
  public String toString() {
    String out = "";
    for (int i = 0; i < nodeGrid.length; i++) {
      for (int j = 0; j < nodeGrid[0].length; j++) {
        out += nodeGrid[i][j];
      }
      out += "\n";
    }
    return out;
  }
  
  private void createStringGrid() {
    try {
      lines = loadStrings("grid.txt");
      for ( int i = 0 ; i < lines.length ; i ++ ){
         for ( int j = 0; j < lines[i].length(); j++ ){
            strGrid[i][j]=lines[i].substring(j,j+1);
         } 
      }
    }catch (Exception e) {
      e.printStackTrace();
      System.out.println("File not found");
    }
  }
  
  private void createNodeGrid() {
    nodeGrid = new Node[31][28];
    for (int i = 0; i < strGrid.length; i++) {
      for (int j = 0; j < strGrid[0].length; j++) {
        if (! strGrid[i][j].equals("x")) {
          System.out.println(strGrid[i][j]);
          nodeGrid[i][j] = new Node(j*20+10, i*20+10);
        }
      }
    }
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
}

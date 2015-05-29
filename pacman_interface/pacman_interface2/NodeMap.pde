import java.util.*;
import java.io.*;

class NodeMap {
  
  Node[][] nodeGrid;
  String[][] strGrid;
  String[] lines;
  
  public NodeMap() {
    strGrid = new String[31][28];
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
  
  public String toString() {
    Arrays.toString(lines);
    return "";
  }
}

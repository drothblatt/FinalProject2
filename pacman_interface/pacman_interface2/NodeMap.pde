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

import java.util.*;
import java.io.*;

class NodeMap {
  
  Node[][] nodeGrid;
  String[][] strGrid;
  
  public NodeMap() {
    strGrid = new String[31][28];
    try {
      Scanner sc = new Scanner(new File("grid.txt"));
      for (int row = 0; sc.hasNextLine(); row++) {
        for (int col = 0; sc.hasNext("x") || sc.hasNext(" "); col++) {
          strGrid[row][col] = sc.next();
        }
      }
    }catch (FileNotFoundException e) {
      System.out.println("File not found");
    }
  }
  
  public String toString() {
    Arrays.toString(strGrid);
    return "";
  }
}

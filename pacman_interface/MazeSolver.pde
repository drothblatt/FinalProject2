import java.util.*;
import java.io.*;
public class MazeSolver{
  Node[][] nodes;
  Node[] solutions;
  Node start; 
  Node end;
  
  public MazeSolver(Node[][] n, Node now, Node end){
    nodes = n;
    start = now;
    this.end = end;
    int sx = start.getX()/20 - 1;
    int sy = start.getY()/20 - 1;
    int ex = start.getX()/20 - 1;
    int ey = start.getY()/20 - 1;
  }
  
  public void solve(){
    //Node currNode = nodes[sy][sx];
  }
  
  public Node[] sol(){
    return solutions; 
  }
}

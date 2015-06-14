import java.util.*;
import java.io.*;

public class Maze{
    
    private char[][] maze;
    private int startx,starty,endx,endy;
    private Node start, sol;
    private boolean solvable = true;

    private class Node{
      private int r; // row
      private int c; // column
      private int dFrom; // distance from starting spot
      private Node prev; // last spot

    private Node(int row, int col){
      r = row;
      c = col;
      dFrom = 0;
      prev = null;
    }
  
    private Node(int row, int col, int dist, Node last){
       r = row;
       c = col;
       prev = last;
       dFrom = dist;
    }
  
    private Node(int row, int col, Node last){
        r = row;
        c = col; 
        prev = last;
        dFrom = last.getDFrom();
    }
      
    private int getRow(){
      return r;
    }
    private int getCol(){
      return c;
    }
    private int getDFrom(){
      return dFrom; 
    }
    private int getDTo(){
      return Math.abs(endx - this.getRow()) + Math.abs(endy - this.getCol()); // delta x + delta y
    }
    private Node getPrev(){
      return prev;
    }
    public String toString(){
       return "(" + r + ", " + c + ")";
    }
  }

  private class Frontier{
    private MyDeque<Node> d; 
  
    private Frontier(int mode){
        d = new MyDeque<Node>(15);
    }
    private void add(Node loc){
       d.add(loc, loc.getDTo() + loc.getDFrom() );  // A*
    }
    
    private Node remove(){
      return d.removeSmallest();
    } 
  
    private int size(){
        return d.size();
    }  
  
    public String toString(){
        return d.toString();
    }
  }


  public Maze(Node[][] grid){
    maze = grid;
    start = now;
    this.end = end;
    sx = start.getX()/20 - 1;
    sy = start.getY()/20 - 1;
    ex = end.getX()/20 - 1;
    ey = end.getY()/20 - 1;
    start = new Node(startx, starty);
 }



  private boolean solve(){
    Frontier nexts = new Frontier();
    boolean solFound = false;
    boolean noSol = false;
    nexts.add(start);
    while(!solFound){
        if( nexts.size() == 0 ){
            return false;
        } else if ( findE(nexts, animate) ){
            solFound = true;
        }
    }
        
    if (solFound){
        Node bt = sol.getPrev();
        while (bt.getDFrom() > 0){
          maze[bt.getRow()][bt.getCol()] = '@';
          bt = bt.getPrev();
        }   
        return true;
    } 
    return false;
  }

  private boolean findE(Frontier a, boolean animate){
      if (animate){
          System.out.println(toString(animate));
          wait(70);
      }
      Node p = a.remove();
      System.out.println(p + " " + p.getDTo());
      if (maze[p.getRow()][p.getCol()] == 'E'){
          sol = p; 
          return true;
      } 
      if (maze[p.getRow()][p.getCol()] == ' ' || maze[p.getRow()][p.getCol()] == 'S'){
          if ( maze[p.getRow()][p.getCol()] == ' ' ){
        maze[p.getRow()][p.getCol()] = 'x';
          }
    
          if ( maze[p.getRow()+1][p.getCol()] == ' ' || maze[p.getRow()+1][p.getCol()] == 'E' ){
        a.add(new Node(p.getRow()+1, p.getCol(), p.getDFrom()+1, p));
          }
    
          if ( maze[p.getRow()-1][p.getCol()] == ' ' || maze[p.getRow()-1][p.getCol()] == 'E'){
        a.add(new Node(p.getRow()-1, p.getCol(), p.getDFrom()+1, p));
          }
          if ( maze[p.getRow()][p.getCol()+1] == ' ' || maze[p.getRow()][p.getCol()+1] == 'E' ){
        a.add(new Node(p.getRow(), p.getCol()+1, p.getDFrom()+1, p)); 
          }
          if ( maze[p.getRow()][p.getCol()-1] == ' ' || maze[p.getRow()][p.getCol()-1] == 'E'){
        a.add(new Node(p.getRow(), p.getCol()-1, p.getDFrom()+1, p)); 
          }
      }
      return false;
  }      

  public int[] solutionCoordinates(){ 
    if (sol == null){
      return new int[0];
    }
    int[] retA = new int[(sol.getDFrom()+1)*2];
    Node current = sol;
    for (int i = (sol.getDFrom()+1)*2-1; i >= 0; i-=2 ){
        retA[i] = current.getCol();
        retA[i-1] = current.getRow();
        current = current.getPrev();
    }
    return retA;
  } 

   
    // To-do List...
    // DONE

}

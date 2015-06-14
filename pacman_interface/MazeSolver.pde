import java.util.*;
import java.io.*;
public class MazeSolver {
  Node[][] nodes;
  int[] solutions;
  Node start; 
  Node end;
  int sx, sy, ex, ey;

  public MazeSolver(Node[][] n, Node now, Node end) {
    nodes = n;
    start = now;
    this.end = end;
    sx = start.getX()/20 - 1;
    sy = start.getY()/20 - 1;
    ex = end.getX()/20 - 1;
    ey = end.getY()/20 - 1;
  }

  private class coord {
    int x, y, size;
    coord prev;

    public coord( int x, int y ) {
      this.x=x;
      this.y=y;
      prev=null;
      size=1;
    }

    public coord( int x, int y, coord prev) {
      this.x=x;
      this.y=y;
      this.prev=prev;
      size=prev.getSize()+1;
    }

    public int getX() {
      return x;
    }

    public int getY() {
      return y;
    }

    public coord getPrev() {
      return prev;
    }

    public int getSize() {
      return size;
    }

    public String toString() {
      return "["+getX()+","+getY()+"]";
    }
  }

  private class Frontier {
    MyDeque<coord> frontier;

    public Frontier() {
      frontier = new MyDeque<coord>();
    }

    public void add(coord c) {
      int deltaX = (int)Math.signum(ex-c.getX())*(ex-c.getX());
      int deltaY = (int)Math.signum(ey-c.getY())*(ey-c.getY());
      frontier.add(c, deltaX+deltaY+c.getSize());
    }

    public void addCoords(coord c ) {
      if ( validSquare(c.getX()+1, c.getY())) {
        add(new coord(c.getX()+1, c.getY(), c));
      }
      if ( validSquare(c.getX()-1, c.getY())) {
        add(new coord(c.getX()-1, c.getY(), c));
      }
      if ( validSquare(c.getX(), c.getY()+1)) {
        add(new coord(c.getX(), c.getY()+1, c));
      }
      if ( validSquare(c.getX(), c.getY()-1)) {
        add(new coord(c.getX(), c.getY()-1, c));
      }
    }

    public coord remove() {
      return frontier.removeSmallest();
    }

    public boolean isEmpty() {
      return frontier.isEmpty();
    }

    public String toString() {
      return frontier.toString();
    }
  }

  public void solve() {
    Frontier f = new Frontier();
    coord now = new coord(sx, sy);
    //System.out.print(nodes[now.getX()][now.getY()]+",");
    //System.out.print(nodes[ex][ey]);
    while (nodes[now.getX()][now.getY()]!=nodes[ex][ey]) {
      f.addCoords(now);
      if (f.isEmpty()) {
        return;
      }
      now = f.remove();
      System.out.println(now);
    }
    solutions = new int[now.getSize()*2];
    int n = solutions.length;
    while ( n > 0 ) {
      solutions[--n]=now.getY();
      solutions[--n]=now.getX();
      now=now.getPrev();
    }
    //System.out.println(Arrays.toString(solutions));
  }

  public Node nextStep() {
    return new Node(solutions[2]*20+30, solutions[3]*20+30);
  }

  public boolean validSquare(int x, int y) {
    return nodes[y][x]==null;
  }
}


import java.util.*;
import java.io.*;
public class MazeSolver {
  String[][] grid;
  Coord[] solutions;
  Node start; 
  Node end;
  int sx, sy, ex, ey;

  public MazeSolver(String[][] n, Node now, Node end) {
    grid = n;
    start = now;
    this.end = end;
    sx = start.getX()/20 - 1;
    sy = start.getY()/20 - 1;
    ex = end.getX()/20 - 1;
    ey = end.getY()/20 - 1;
    grid[ey][ex] = "E";
  }



  private class Frontier {
    MyHeap frontier;

    public Frontier() {
      frontier = new MyHeap(false);
    }

    public void add(Coord c) {
      frontier.add(c);
    }

    public void addCoords(Coord c ) {
      if ( validSquare(c.getX()+1, c.getY())) {
        add(new Coord(c.getX()+1, c.getY(), c, dist2(c.getX(), ex, c.getY(), ey)));
      }
      if ( validSquare(c.getX()-1, c.getY())) {
        add(new Coord(c.getX()-1, c.getY(), c, dist2(c.getX(), ex, c.getY(), ey)));
      }
      if ( validSquare(c.getX(), c.getY()+1)) {
        add(new Coord(c.getX(), c.getY()+1, c, dist2(c.getX(), ex, c.getY(), ey)));
      }
      if ( validSquare(c.getX(), c.getY()-1)) {
        add(new Coord(c.getX(), c.getY()-1, c, dist2(c.getX(), ex, c.getY(), ey)));
      }
    }

    public Coord remove() {
      return frontier.remove();
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
    Coord now = new Coord(sx, sy, null, dist2((float)sx, (float)ex, (float)sy, (float)ey));
    //System.out.print(nodes[now.getX()][now.getY()]+",");
    //System.out.print(nodes[ex][ey]);
    while (!grid[now.getY()][now.getX()].equals("E")) {
      f.addCoords(now);
      if (f.isEmpty()) {
        return;
      }
      now = f.remove();
      System.out.println(now);
    }
    solutions = new Coord[now.getSize()*2];
    int n = solutions.length-1;
    while ( n > 0 ) {
      solutions[n] = now;
      //System.out.println(now);
      now=now.getPrev();
    }
    //System.out.println(Arrays.toString(solutions));
  }

  public Node nextStep() {
    return new Node(solutions[1].getX()*20+30, solutions[1].getY()*20+30);
  }

  public boolean validSquare(int x, int y) {
    return !grid[y][x].equals("#");
  }

  public float square(float i) {
    return i*i;
  }
  public float dist2(float x1, float x2, float y1, float y2) {
    return square(x1-x2)+square(y1-y2);
  }
}


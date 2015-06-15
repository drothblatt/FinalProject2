import java.util.*;

public class MyHeap {

  private Coord[] heap;
  private int mode;
  private int size;

  private static final int MAX = 1;
  private static final int MIN = -1;
  private static final int UP = 1;
  private static final int DOWN = -1;

  public MyHeap() {
    this(true);
  }
  public MyHeap(boolean isMax) {
    if (isMax) {
      mode = MAX;
    } else {
      mode = MIN;
    }
    heap = new Coord[4];
    size = 0;
  }

  public void add(Coord cor) {
    if (size == heap.length) {
      resize();
    }
    
    heap[size] = cor;
    size++;
    shiftUp();
  }
  public Coord remove() throws NoSuchElementException {
    if (size == 0) {
      throw new NoSuchElementException();
    }
    Coord output = heap[0];
    swap(0, size-1);
    heap[size-1] = null;
    size--;
    shiftDown();
    return output;
  }

  public String toString() {
    return Arrays.toString(heap);
  }

  public Coord peek() {
    return heap[0];
  }

  private void swap(int index1, int index2) {
    Coord temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }
  private void resize() {
    heap = Arrays.copyOf(heap, (size)*2);
  }
  private void shiftUp() {
    int last = size-1;
    while (heap[last].getPriority()*mode >= heap[(last-1)/2].getPriority()*mode && last != 1) {
      //System.out.println(heap[last]);
      swap(last, (last-1)/2);
      last = (last-1)/2;
    }
  }
  private void shiftDown() {
    int first = 1;
    while (first*2+1 < size
      && (heap[first].getPriority()*mode < heap[first*2+1].getPriority()*mode 
      || heap[first].getPriority()*mode < heap[first*2+2].getPriority()*mode)) {

      if (heap[first*2].getPriority()*mode > heap[first*2+2].getPriority()*mode) {
        swap(first, first*2+1);
        first = first * 2 + 1;
      } else {
        swap(first, first*2+2);
        first = first * 2 + 2;
      }
    }
  }
  private boolean isEmpty() {
    return size == 0;
  }
}


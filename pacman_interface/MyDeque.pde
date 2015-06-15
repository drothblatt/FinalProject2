import java.util.*;
public class MyDeque<T> {
  int head, tail;//holds the index of the start and end of the queue
  int size; //number of elements
  Object[] queue;
  int[] priority;

  public MyDeque() {
    queue = new Object[10];
    priority = new int[10];
    head = 0;
    tail = 1;
    size=0;
  }

  public void resize() {
    Object[] queue2 = new Object[queue.length*2];
    int i1 = head + 1 ;//to put into queue
    int i2 = 0;//to put into queue2
    int nowIndex = i1 % queue.length;
    int endIndex = (tail - 1) % queue.length;
    while ( nowIndex != endIndex ) {
      queue2[i2++]=queue[nowIndex];
      i1++;
      nowIndex = i1 % queue.length;
    }
    queue2[i2] = queue[nowIndex];

    int[] priority2 = new int[priority.length*2];
    int p1 = head + 1; 
    int p2 = 0;
    nowIndex = p1 % priority.length;
    while ( nowIndex != endIndex ) {
      priority2[p2++]=priority[nowIndex];
      p1++;
      nowIndex = p1 % priority.length;
    }
    priority2[p2]=priority[nowIndex];

    head = queue2.length - 1;
    tail = queue.length;
    queue = queue2;
    priority = priority2;
  }


  public void add(T value, int p) {
    if ( size == queue.length ) {
      resize();
    }
    if ( tail == queue.length ) {
      tail = 0;
    }
    queue[tail]=value;
    priority[tail]=p;

    tail++;
    size++;
  }

  public void addFirst(T value) {
    if (size==queue.length) {
      resize();
    }
    queue[head--]=value;
    if ( head < 0 ) {
      head = queue.length - 1;
    }

    size++;
  }

  public void addLast(T value) {
    if ( size == queue.length ) {
      resize();
    }
    queue[tail++]=value;
    if ( tail == queue.length ) {
      tail = 0;
    }
    size++;
  }

  public T removeFirst() {
    if ( size == 0 ) {
      throw new NoSuchElementException();
    }
    if ( head == queue.length -1) {
      head = -1;
    }
    T ret = (T)queue[++head%queue.length];
    size--;
    return ret;
  }

  public T removeLast() {
    if (size == 0) {
      throw new NoSuchElementException();
    }
    T ret = (T)queue[--tail%queue.length];
    size--;
    return ret;
  }

  public T removeSmallest() {
    if (size == 0) {
      throw new NoSuchElementException();
    }
    int nowIndex = ( head + 1 ) % queue.length;
    for ( int i = nowIndex; i % queue.length != tail % queue.length; i ++ ) {
      if ( priority[nowIndex] > priority[i % queue.length]) {
        nowIndex = i % queue.length;
      }
    }
    T ret = (T)queue[nowIndex];

    for ( int i = nowIndex; i % queue.length != ( tail - 1 ) % queue.length; i ++ ) {
      queue[i % queue.length]=queue[(i + 1) % queue.length];
      priority[i % priority.length]=priority[(i + 1) % priority.length];
    }
    tail --;
    size --;
    return ret;
  }

  public T getFirst() {
    if ( size==0 ) {
      throw new NoSuchElementException();
    }
    return (T)queue[(head+1)%queue.length];
  }

  public T getLast() {
    if ( size==0 ) {
      throw new NoSuchElementException();
    }
    return (T)queue[(tail-1+queue.length)%queue.length];
  }

  public String toString() {
    String ret = "[ ";
    int n = head + 1;
    int nowIndex = n % queue.length;
    int endIndex = (tail - 1) % queue.length;
    while ( nowIndex != endIndex ) {
      ret+= queue [nowIndex] + " ";
      n++;
      nowIndex = n % queue.length;
    }
    ret += queue[nowIndex] + "]\n[ ";

    int p = head + 1;
    nowIndex = p % priority.length;
    while ( nowIndex != endIndex ) {
      ret+= priority[nowIndex] + " "; 
      p++;
      nowIndex = p % priority.length;
    }
    ret+= priority[nowIndex] + "]";
    return ret;
  }

  public boolean isEmpty() {
    return size==0;
  }
}


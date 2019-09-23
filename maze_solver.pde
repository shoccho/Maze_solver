import java.util.*;
boolean solve=false;
int cols;
int rows;
int scl=10;
Cell[][] grid = new Cell[41][41];
Cell finish ;
Cell current;
Stack<Cell> stack = new Stack<Cell>();  
void setup() {
  size(401, 401);
  cols=(width/scl);
  rows= (height/scl);
  for (int i=0; i<=cols; i++) {
    for (int j=0; j<=rows; j++) {
      Cell cell = new Cell(i, j);
      grid[i][j]=cell;
    }
  }
  current=grid[0][0];
  finish = grid[0][00];
  while (true) {
    current.visited=true;
    //current.show();
    Cell next=  current.checkNeighbors();
    if (next!= null) {
      // print(next.i,next.j+"\n");
      next.visited= true;

      stack.push(current);


      int x=current.i-next.i;
      if (x==1) {
        current.walls[0]=false;
        next.walls[2]=false;
      } else if (x==-1) {
        next.walls[0]=false;
        current.walls[2]=false;
      } 
      int y=current.j-next.j;
      if (y==1) {
        current.walls[3]=false;
        next.walls[1]=false;
      } else if (y==-1) {
        next.walls[3]=false;
        current.walls[1]=false;
      } 

      current=next;
    } else if (stack.size()>0) {
      current=stack.pop();
    }
    if (stack.size()==0)break;
  }
}


void mousePressed() {

  finish= grid[mouseY/scl][ mouseX/scl];
  finish.finish=true;
  solve=true;
}
void keyPressed() {
  if (key=='a') {
  }
}

void draw() {


  if (solve ) {

    current.Svisited=true;


    Cell next=  current.ScheckNeighbors();
    if (next!= null) {

      println("running");
      next.Svisited= true;

      stack.push(current);

      next.parent=current;


      current=next;
    } else if (stack.size()>0) {
      current=stack.pop();
    }
  }
  background(0, 0, 255);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {

      grid[i][j].show();
    }
  }//
  Cell traverser=current;
  if (solve && current==finish) {

    grid[0][0].inSolvePath=true;
    while (traverser!=grid[0][0]) {
      traverser.inSolvePath=true;
   
      traverser=traverser.parent;
 
    }
    solve=false;
  }

}

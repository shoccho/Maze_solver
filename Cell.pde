class Cell {
  Cell parent;

  boolean finish=false;
  boolean inSolvePath=false;
  int i;
  int j;
  boolean visited= false;
  boolean Svisited= false;
  boolean[] walls ={true, true, true, true};
  Cell(int ni, int nj) {
    i=ni;
    j=nj;
  }

  // walls 0 -top || 1 - right || 2- bottom || 3 -left

  void show() {
    int x= j*scl;
    int y=i*scl;
    if (inSolvePath) {
      fill(243,57,0);
      noStroke();
      rect(x, y, scl, scl);
    } else if (finish) {
      fill(0, 255, 255);
      noStroke();
      rect(x, y, scl, scl);
    } else if (Svisited) {
      fill(157, 132, 78);
      noStroke();
      rect(x, y, scl, scl);
    } else if (visited) {
      fill(90, 150, 80);
      noStroke();
      rect(x, y, scl, scl);
    }
    stroke(0);
    strokeWeight(2);
    noFill();

    if (walls[0])//top
      line(x, y, x+scl, y);
    if (walls[1])//right
      line(x+scl, y, x+scl, y+scl);
    if (walls[2])//bottom
      line(x, y+scl, x+scl, y+scl);
    if (walls[3])//left
      line(x, y, x, y+scl);
  }

  Cell checkNeighbors() {
    Cell[] neighbors= new Cell[4];
    int k=0;
    if (j>0 ) {
      Cell top= grid[i][j-1];
      if (!top.visited)neighbors[k++]=top;
    }
    if (i<cols-1) {
      Cell right = grid[i+1][j];
      if (!right.visited)neighbors[k++]=right;
    }
    if (j<rows-1) {
      Cell bottom =grid[i][j+1];
      if (!bottom.visited)neighbors[k++]=bottom;
    }
    if (i>0) {
      Cell left = grid[i-1][j];
      if (!left.visited)neighbors[k++]=left;
    }
    if (k>=0) {
      int r = floor(random(0, k));
      // print(r);
      return neighbors[r];
    } else {
      return null ;
    }
  }
  Cell ScheckNeighbors() {
    Cell[] neighbors= new Cell[4];
    int k=0;
    if (j>0 ) {
      Cell top= grid[i][j-1];
      if (!top.Svisited && !top.walls[1])neighbors[k++]=top;
    }
    if (i<cols-1) {
      Cell right = grid[i+1][j];
      if (!right.Svisited && !right.walls[0])neighbors[k++]=right;
    }
    if (j<rows-1) {
      Cell bottom =grid[i][j+1];
      if (!bottom.Svisited && !bottom.walls[3])neighbors[k++]=bottom;
    }
    if (i>0) {
      Cell left = grid[i-1][j];
      if (!left.Svisited && !left.walls[2])neighbors[k++]=left;
    }
    if (k>=0) {
      int r = floor(random(0, k));
      // print(r);
      return neighbors[r];
    } else {
      return null ;
    }
  }
}

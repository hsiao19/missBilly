class MainCanvas {
  NodesBase nodesBase;

  MainCanvas(NodesBase nodesBase) {
    this.nodesBase = nodesBase;
  }

  /* 顯示垂直線 */
  void displayVertical() {
    noFill();
    for (int x=0; x<nodesBase.xAxisNodeNum; x++) {
      beginShape();
        for (int y=0; y<nodesBase.yAxisNodeNum; y++) {
          nodesBase.nodes[x][y].getVertex();
        }
      endShape();
    }
  }

  /* 顯示水平線 */
  void displayHorizontal() {
    noFill();
    for (int y=0; y<nodesBase.yAxisNodeNum; y++) {
      beginShape();
        for (int x=0; x<nodesBase.xAxisNodeNum; x++) {
          nodesBase.nodes[x][y].getVertex();
        }
      endShape();
    }
  }

  /* 顯示網格 */
  void displayMesh() {
    this.displayVertical();
    this.displayHorizontal();
  }

  // TODO
  void addDepthColor(int level, int dist) {        
     //for (int i=1; i<=level; i++) {
     //  int depth = dist * i * (-1);
     //  int alpha = i * 100;
     //  fill(255, alpha);
     //  beginShape();
     //    vertex(0, 0, depth);
     //    vertex(width, 0,  depth);
     //    vertex(width, height,  depth);
     //    vertex(0, height,  depth);
     //  endShape();
     //}        
  }
}
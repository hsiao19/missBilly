class LightBillyNormalShape extends Shape {
  LightBillyNormalShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
  }
    //void shine(){
    //    stroke = 
    //}
}

class LightBillyInteractShape extends Shape {
    int X,Y;
    float FORCE_RADIOUS = this.scope[1]; 
    float MAX_FORCE = 5.0;
    
    LightBillyInteractShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
        X = this.scope[0];
        Y = this.scope[1];
    }

    void makeHole() {
      for(int y = 0; y < Y; y += 1){
        beginShape();
        curveVertex(this.nodes[0][y].x, this.nodes[0][y].y);
        for(int x = 0; x < X; x += 1){
          curveVertex(this.nodes[x][y].x, this.nodes[x][y].y);  
        }
        curveVertex(this.nodes[X - 1][y].x, this.nodes[X - 1][y].y);
        endShape();
      }
      if(mousePressed){
        PVector holeCenter = new PVector(this.scope[0]/2 + FORCE_RADIOUS / 2, this.scope[1]/2 + FORCE_RADIOUS / 2);
        for(int y = 0; y < Y; y ++){
          for(int x = 0; x < X; x ++){
            float d = PVector.dist(this.nodes[x][y], holeCenter);
            if(d < FORCE_RADIOUS){
              PVector force = PVector.sub(this.nodes[x][y], holeCenter);
              force.normalize();
              force.mult(map(d, 0, FORCE_RADIOUS, MAX_FORCE, 0));
              this.nodes[x][y].add(force);
            }
          }
        }  
      }
    }
}
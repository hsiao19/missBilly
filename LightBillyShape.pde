class LightBillyNormalShape extends Shape {
  LightBillyNormalShape(NodesBase nodesBase, int[] scope, int[] locate) {
    super(nodesBase, scope, locate);
  }
  
  void shine(){
    float shineDegree = random(50);
    stroke(255 - shineDegree);
  }
  
  void motion(){
    shine();
  }
}

class LightBillyInteractShape extends Shape {
  float FORCE_RADIOUS = 200; 
  float MAX_FORCE = 10.0;
    
  LightBillyInteractShape(NodesBase nodesBase, int[] scope, int[] locate) {
    super(nodesBase, scope, locate);
  }

  void makeHole() {
    for(int x = 0; x < this.scope[0]; x++){
      for(int y = 0; y < this.scope[1]; y++){
        beginShape();
        curveVertex(this.nodes[x][y].x, this.nodes[x][y].y);  
        endShape();
        PVector holeCenter = new PVector(250 ,250);
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
  
  void motion(){
    makeHole();
  }
}
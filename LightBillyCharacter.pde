class LightBillyCharacter extends Character {
  LightBillyCharacter(NodesBase nodesBase) {
    super(nodesBase);
    normalShape = new LightBillyNormalShape[1][1];
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    for (int x=0; x<normalShape.length; x++) {
      for (int y=0; y<normalShape[x].length; y++) {
        normalShape[x][y] = new LightBillyNormalShape(this.nodesBase, normalScope, normalLocation);
      }
    }
    
    interactShape = new LightBillyInteractShape[3][7];
    int[] interactScope = {SHAPE_WIDTH, SHAPE_HEIGHT};
    for (int x=0; x<interactShape.length; x++) {
      for (int y=0; y<interactShape[x].length; y++) {
        int[] interactLocation = {(SHAPE_WIDTH * x), (SHAPE_HEIGHT * y)};
        //println("======================");
        //println(x, y);
        //println("location", interactLocation[0], interactLocation[1]);
        //println("scope", interactScope[0], interactScope[1]);
        //println("right left", interactLocation[0] + interactScope[0], interactLocation[1] + interactScope[1]);
        //println("unbounded", this.isShapeUnbounded(interactLocation, interactScope));
        interactShape[x][y] = new LightBillyInteractShape(this.nodesBase, interactScope, interactLocation);  
      }
    }
  }
}
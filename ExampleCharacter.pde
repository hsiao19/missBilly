class ExampleCharacter extends Character {
  ExampleCharacter(NodesBase nodesBase) {
    super(nodesBase);
    normalShape = new ExampleNormalShape[1][1];
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    for (int x=0; x<normalShape.length; x++) {
      for (int y=0; y<normalShape[x].length; y++) {
        normalShape[x][y] = new ExampleNormalShape(this.nodesBase, normalScope, normalLocation);
      }
    }
    
    interactShape = new ExampleInteractShape[3][7];
    int[] interactScope = {SHAPE_WIDTH, SHAPE_HEIGHT};
    for (int x=0; x<interactShape.length; x++) {
      for (int y=0; y<interactShape[x].length; y++) {
        
        int[] interactLocation = {(SHAPE_WIDTH * x), (SHAPE_HEIGHT * y)};
        interactShape[x][y] = new ExampleInteractShape(this.nodesBase, interactScope, interactLocation);  
      }
    }
  }
}
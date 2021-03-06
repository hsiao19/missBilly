class OldBillyCharacter extends Character {
  OldBillyCharacter(NodesBase nodesBase) {
    super(nodesBase);
    normalShape = new OldBillyNormalShape[1][1];
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    for (int x=0; x<normalShape.length; x++) {
      for (int y=0; y<normalShape[x].length; y++) {
        normalShape[x][y] = new OldBillyNormalShape(this.nodesBase, normalScope, normalLocation);
      }
    }
    
    interactShape = new OldBillyInteractShape[3][7];
    int[] interactScope = {SHAPE_WIDTH, SHAPE_HEIGHT};
    for (int x=0; x<interactShape.length; x++) {
      for (int y=0; y<interactShape[x].length; y++) {
        
        int[] interactLocation = {(SHAPE_WIDTH * x), (SHAPE_HEIGHT * y)};
        interactShape[x][y] = new OldBillyInteractShape(this.nodesBase, interactScope, interactLocation);  
      }
    }
  }
}
class OldBillyCharacter extends Character {
  OldBillyNormalShape oldBillyNormalShape;
  OldBillyInteractShape oldBillyInteractShape;
  OldBillyInteractShape oldBillyInteractShape2;

  OldBillyCharacter(NodesBase nodesBase) {
    super(nodesBase);
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    
    int[] interactScope = {51, 10};
    
    for(int i = 0; i < STAGE_COUNT; i++){
        int[] interactLocation = {0, 1 + 10 * i};
        oldBillyInteractShape = new OldBillyInteractShape(this.nodesBase, interactScope, interactLocation);
    }
    
    
    
    
    oldBillyNormalShape = new OldBillyNormalShape(this.nodesBase, normalScope, normalLocation);
    oldBillyInteractShape = new OldBillyInteractShape(this.nodesBase, interactScope, interactLocation);
    oldBillyInteractShape2 = new OldBillyInteractShape(this.nodesBase, interactScope, interactLocation2);
  }

  void displayNormalShape() { // 新 function
    oldBillyNormalShape.addWaves();
  }
  
  void displayInteractShape() { // 新 function
    oldBillyInteractShape.addWaves();
  }
  
  void displayInteractShape2() { // 新 function
    oldBillyInteractShape2.addWaves();
  }
  
}
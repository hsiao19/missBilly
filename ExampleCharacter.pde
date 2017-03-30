class ExampleCharacter extends Character {
   
  ExampleNormalShape exampleNormalShape;
  ExampleInteractShape exampleInteractShape;

  ExampleCharacter(NodesBase nodesBase) {
    super(nodesBase);
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    exampleNormalShape = new ExampleNormalShape(this.nodesBase, normalScope, normalLocation);
    int[] interactScope = {51, 10};
    int[] interactLocation = {0, 21};
    exampleInteractShape = new ExampleInteractShape(this.nodesBase, interactScope, interactLocation);
  }

    void displayNormalShape() { // 新 function
      // exampleNormalShape.addWaves();
    }
    
    void displayInteractShape() { // 新 function
        exampleInteractShape.addDepth();
    }
  
  //  void createInteractShape(int[] location) {
  //      int[] interactScope = {10, 10};
  //      exampleInteractShape.addDepth();
  //  }
}
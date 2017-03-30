class LightBillyCharacter extends Character {
   
  LightBillyNormalShape lightBillyNormalShape;
  LightBillyInteractShape lightBillyInteractShape;

  LightBillyCharacter(NodesBase nodesBase) {
    super(nodesBase);
    int[] normalScope = {51, 71};
    int[] normalLocation = {0, 0};
    int[] interactScope = {51, 51};
    int[] interactLocation = {0, 0};
    lightBillyNormalShape = new LightBillyNormalShape(this.nodesBase, normalScope, normalLocation);
    lightBillyInteractShape = new LightBillyInteractShape(this.nodesBase, interactScope, interactLocation);
  }

    void displayNormalShape() { // 新 function
      // lightBillyNormalShape.addWaves();
    }
    
    void displayInteractShape() { // 新 function
      lightBillyInteractShape.makeHole();
    }
  
    //void createInteractShape(int[] location) {
    //    int[] interactScope = {10, 10};
    //    lightBillyInteractShape.makeHole();
    //}
}
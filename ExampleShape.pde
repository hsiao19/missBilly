class ExampleNormalShape extends Shape {
   
  ExampleNormalShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
  }
    
}

class ExampleInteractShape extends Shape {

    ExampleInteractShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
    }

    void addDepth() {
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                this.nodes[x][y].add(0, 0, -10);
            }
        }
    }

    void motion() {
        addDepth();
    }
}
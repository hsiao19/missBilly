class ExampleCharacter extends Character {

    ExampleCharacter(NodesBase nodesBase) {
        super(nodesBase);

        int[] scope = {5, 4};
        int[] location = {2, 2};
        interactShape = new ExampleShape[1][1];
        for (int x=0; x<interactShape.length; x++) {
            for (int y=0; y<interactShape[x].length; y++) {
                 interactShape[x][y] = new ExampleShape(this.nodesBase, scope, location);
            }           
        }
    }

    void moveExampleShape() {
        
    }
}
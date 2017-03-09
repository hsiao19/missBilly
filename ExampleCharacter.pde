class ExampleCharacter extends Character {
    ExampleShape exampleShape;

    ExampleCharacter(NodesBase nodesBase) {
        super(nodesBase);

        int[] scope = {5, 4};
        int[] location = {2, 2};
        exampleShape = new ExampleShape(this.nodesBase, scope, location);
    }

    void triggerExampleShape() {
        exampleShape.addDepth();
    }

    void moveExampleShape() {
        
    }
}
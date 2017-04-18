class ExampleCharacter extends Character {

    ExampleCharacter(NodesBase nodesBase) {
        super(nodesBase);

        interactShape = new ExampleShape[3][STAIR_NUMS];
        
        int scopeX = floor(baseWidth / interactShape.length);
        int scopeY = floor(baseHeight / interactShape[0].length);
        int[] scope = { scopeX, scopeY };
        
        for (int x=0; x<interactShape.length; x++) {
            for (int y=0; y<interactShape[x].length; y++) {
                int[] location = {scopeX * x, scopeY * y};
                interactShape[x][y] = new ExampleShape(this.nodesBase, scope, location);
            }           
        }
    }
}
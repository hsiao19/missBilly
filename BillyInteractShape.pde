class BillyInteractShape extends Shape {

    BillyInteractShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
    }

    void noiseMotion() {
        int scopeX = this.scope[0];
        int scopeY = this.scope[1];

        for (int x=0; x<scopeX; x++) {
            for (int y=0; y<scopeY; y++) {
                float a = sin(random(PI * 2)) * random(10);
                this.nodes[x][y].add(new PVector(0, 0, -a));
            }
        }      
    }

    void motion() {
        noiseMotion();
    }
}
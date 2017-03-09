class ProjectHandler {
    NodesBase nodesBase;

    MainCanvas mainCanvas;

    // shapes ------------------------------
    ExampleShape exampleShape;

    ProjectHandler () {
        nodesBase = new NodesBase();

        mainCanvas = new MainCanvas(nodesBase);

        int [] sampleScope = {5, 4};
        int [] sampleLocate = {0, 0};
        exampleShape = new ExampleShape(nodesBase, sampleScope, sampleLocate);
    }

    void setEnvironment(color strokeColor, int strokeWeight) {
        stroke(strokeColor);
        strokeWeight(strokeWeight);
    }

    void displayVertical() {
        mainCanvas.displayVertical();
    }

    void displayHorizontal() {
        mainCanvas.displayHorizontal();
    }

    void displayMesh() {
        mainCanvas.displayMesh();
    }

    void addDepthColor(int level, int dist) {
        mainCanvas.addDepthColor(level, dist);
    }

    // SHAPE EXAMPLE -----------------------
    void exampleShapeAddDepth() {
        exampleShape.addDepth();
    }
}

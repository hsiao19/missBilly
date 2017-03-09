class ProjectHandler {
    NodesBase nodesBase;

    MainCanvas mainCanvas;

    ShapeExample shape;

    ProjectHandler () {
        nodesBase = new NodesBase();

        mainCanvas = new MainCanvas(nodesBase);
        // shape = new ShapeExample(nodesBase);
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
}

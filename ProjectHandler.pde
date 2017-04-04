class ProjectHandler {
    NodesBase nodesBase;

    MainCanvas mainCanvas;

    // characters ------------------------------
    ExampleCharacter exampleCharacter;

    ProjectHandler () {
        nodesBase = new NodesBase();

        mainCanvas = new MainCanvas(nodesBase);
        exampleCharacter = new ExampleCharacter(nodesBase);
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

    // CHARACTER RELATED
    void displayExampleCharacter() {
        exampleCharacter.displayInteractShape();
    }
    void triggerExampleInteraction() {
        exampleCharacter.triggerInteractShape(0, 0);
    }
}
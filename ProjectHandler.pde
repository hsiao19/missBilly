class ProjectHandler {
    NodesBase nodesBase;

    MainCanvas mainCanvas;

    // shapes ------------------------------
    ExampleCharacter exampleCharacter;

    ProjectHandler () {
        nodesBase = new NodesBase();

        mainCanvas = new MainCanvas(nodesBase);

        int [] sampleScope = {5, 4};
        int [] sampleLocate = {0, 0};
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

    // CHARACTER EXAMPLE -----------------------
    void triggerExampleCharacter() {
        exampleCharacter.triggerShape1();
    }
}
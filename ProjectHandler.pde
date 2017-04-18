class ProjectHandler {
  NodesBase nodesBase;

  MainCanvas mainCanvas;

  // characters ------------------------------
  ExampleCharacter exampleCharacter;
  OldBillyCharacter oldBillyCharacter;
  LightBillyCharacter lightBillyCharacter;
  SensitiveBillyCharacter sensitiveBillyCharacter;
  NetCharacter netCharacter;

  ProjectHandler () {
    nodesBase = new NodesBase();

    mainCanvas = new MainCanvas(nodesBase);
    exampleCharacter = new ExampleCharacter(nodesBase);
    oldBillyCharacter = new OldBillyCharacter(nodesBase);
    lightBillyCharacter = new LightBillyCharacter(nodesBase);
    sensitiveBillyCharacter = new SensitiveBillyCharacter(nodesBase);
    netCharacter = new NetCharacter(nodesBase);
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
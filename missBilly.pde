/* configs --------------------------- */
// graphic related
float MESH_WIDTH = 50;
float MESH_HEIGHT = 50;
int STROKE_WEIGHT = 2;
int STAIR_NUMS = 3;

ProjectHandler projectHandler;

void setup(){
    size(720, 600, P3D);
    projectHandler = new ProjectHandler();

    projectHandler.setEnvironment(color(255), STROKE_WEIGHT);
}

void draw(){
    background(0);
    projectHandler.displayMesh();
    projectHandler.addDepthColor(10, 500);

    projectHandler.billy.displayAllShapes();
    projectHandler.exampleCharacter.displayAllShapes();

    if (keyPressed) {
        if (key == 'A' || key == 'a') {
            projectHandler.billy.triggerInteractShape(0, 0);
        }
        if (key == 'S' || key == 's') {
            projectHandler.exampleCharacter.triggerInteractShape(0, 0);
        }
    }
}
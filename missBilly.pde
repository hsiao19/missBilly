/* configs --------------------------- */
// graphic related
float MESH_WIDTH = 50;
float MESH_HEIGHT = 50;
int STROKE_WEIGHT = 2;

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

    if (keyPressed) {
    	if (key == 'A' || key == 'a') {
    		projectHandler.triggerExampleCharacter();
    	}
    }
}
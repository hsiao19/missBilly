/* configs --------------------------- */
// graphic related
float MESH_WIDTH = 10;
float MESH_HEIGHT = 10;
int STROKE_WEIGHT = 1;
int STAGE_NUM = 7;
int billy = 0;
int displayTheShape = 0;

ProjectHandler projectHandler;

void setup(){
    size(500, 700, P3D);
    projectHandler = new ProjectHandler();
    projectHandler.setEnvironment(color(255), STROKE_WEIGHT);
}

void draw(){
    background(0);
    projectHandler.displayMesh();
    projectHandler.addDepthColor(10, 500);

    // Switch Character
    if(keyPressed){
        if(key == 'E'||key == 'e'){
            billy = 1;
        }
        if(key == 'O'||key == 'o'){
            billy = 2;
        } 
        if(key == 'L'||key == 'l'){
            billy = 3;
        }
    }
    
    // Example
    if(billy == 1){
        projectHandler.exampleCharacter.displayInteractShape();
    }
    
    // OldBilly
    if(billy == 2){
        projectHandler.oldBillyCharacter.displayNormalShape();
        if(mouseY / 10 < 11){
          projectHandler.oldBillyCharacter.displayInteractShape();
          
        }
        if(mouseY / 10 < 21 && mouseY / 10 > 11){
          projectHandler.oldBillyCharacter.displayInteractShape2();
        }
        //if(mouseY / 10 < 31 && mouseY / 10 > 20){
        //  int[] l = {int(0), int(21)};
        //  projectHandler.oldBillyCharacter.createInteractShape(l);
        //}
        //if(mouseY / 10 < 41 && mouseY / 10 > 30){
        //  int[] l = {int(0), int(31)};
        //  projectHandler.oldBillyCharacter.createInteractShape(l);
        //}
        //if(mouseY / 10 < 51 && mouseY / 10 > 40){
        //  int[] l = {int(0), int(41)};
        //  projectHandler.oldBillyCharacter.createInteractShape(l);
        //}
        //if(mouseY / 10 <61 && mouseY / 10 > 50){
        //  int[] l = {int(0), int(51)};
        //  projectHandler.oldBillyCharacter.createInteractShape(l);
        //}
        //if(mouseY / 10 < 71 && mouseY / 10 > 60){
        //  int[] l = {int(0), int(61)};
        //  projectHandler.oldBillyCharacter.createInteractShape(l);
        //}
    }
    
    // LightBilly
    if(billy == 3){
        projectHandler.lightBillyCharacter.displayInteractShape();
    }
}
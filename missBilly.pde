/* configs --------------------------- */
// graphic related
int WIDTH = 500; //下面要記得改
int HEIGHT = 700; //下面要記得改
int STAIR_NUMS = 3;

int MESH_WIDTH = 10;
int MESH_HEIGHT = 10;

int SCOPE_WIDTH = WIDTH / MESH_WIDTH + 1;
int SCOPE_HEIGHT = HEIGHT / MESH_HEIGHT + 1;

int STROKE_WEIGHT = 1;

int SUM_X = 3;
int SUM_Y = 7;

int SHAPE_WIDTH = floor(SCOPE_WIDTH / SUM_X);
int SHAPE_HEIGHT = floor(SCOPE_HEIGHT / SUM_Y);

char BILLYSTAGE = 'E';
int textX = 0;
int textY = 0;

boolean KEYBOARD_TEST = true;

ProjectHandler projectHandler;

void setup(){
  size(500, 700, P3D);
  projectHandler = new ProjectHandler();
  projectHandler.setEnvironment(color(255), STROKE_WEIGHT);
}

void draw() {
    // base setting
    background(0);
    projectHandler.displayMesh();
    projectHandler.addDepthColor(10, 500);


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
  // Switch Character
  if (BILLYSTAGE == 'E') {
    projectHandler.exampleCharacter.displayAllShapes();
    if(keyPressed){
        if(key == 'q'){textX = 2;textY = 0;}
        if(key == 'a'){textX = 1;textY = 0;} 
        if(key == 'z'){textX = 0;textY = 0;}
        if(key == 'w'){textX = 2;textY = 1;}
        if(key == 's'){textX = 1;textY = 1;} 
        if(key == 'x'){textX = 0;textY = 1;}
        if(key == 'e'){textX = 2;textY = 2;}
        if(key == 'd'){textX = 1;textY = 2;} 
        if(key == 'c'){textX = 0;textY = 2;}
        projectHandler.exampleCharacter.triggerInteractShape(textX, textY);
  if (BILLYSTAGE == 'O') {
    projectHandler.oldBillyCharacter.displayAllShapes();
    if(keyPressed){
        if(key == 'q'){textX = 2;textY = 0;}
        if(key == 'a'){textX = 1;textY = 0;} 
        if(key == 'z'){textX = 0;textY = 0;}
        if(key == 'w'){textX = 2;textY = 1;}
        if(key == 's'){textX = 1;textY = 1;} 
        if(key == 'x'){textX = 0;textY = 1;}
        if(key == 'e'){textX = 2;textY = 2;}
        if(key == 'd'){textX = 1;textY = 2;} 
        if(key == 'c'){textX = 0;textY = 2;}
        projectHandler.oldBillyCharacter.triggerInteractShape(textX, textY);
    }
  }
  if (BILLYSTAGE == 'L') {
    projectHandler.lightBillyCharacter.displayAllShapes();
    if(keyPressed){
        if(key == 'q'){textX = 2;textY = 0;}
        if(key == 'a'){textX = 1;textY = 0;} 
        if(key == 'z'){textX = 0;textY = 0;}
        if(key == 'w'){textX = 2;textY = 1;}
        if(key == 's'){textX = 1;textY = 1;} 
        if(key == 'x'){textX = 0;textY = 1;}
        if(key == 'e'){textX = 2;textY = 2;}
        if(key == 'd'){textX = 1;textY = 2;} 
        if(key == 'c'){textX = 0;textY = 2;}
        projectHandler.lightBillyCharacter.triggerInteractShape(textX, textY);
    }
  }
  
  if(keyPressed){
    if(key == '2'){
      BILLYSTAGE = 'E'; 
      projectHandler.exampleCharacter.triggerNormalShape(0, 0);
      SUM_X = projectHandler.exampleCharacter.interactShape.length;
      SUM_Y = projectHandler.exampleCharacter.interactShape[0].length;
    }
    if(key == '3'){
      BILLYSTAGE = 'O';
      projectHandler.oldBillyCharacter.triggerNormalShape(0, 0);
      SUM_X = projectHandler.oldBillyCharacter.interactShape.length;
      SUM_Y = projectHandler.oldBillyCharacter.interactShape[0].length;
    } 
    if(key == '4'){
      BILLYSTAGE = 'L';
      projectHandler.lightBillyCharacter.triggerNormalShape(0, 0);
      SUM_X = projectHandler.lightBillyCharacter.interactShape.length;
      SUM_Y = projectHandler.lightBillyCharacter.interactShape[0].length;
    }
  }
}
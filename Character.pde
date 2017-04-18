class Character {
    NodesBase nodesBase;
    Shape[][] interactShape;
    Shape[][] normalShape;
    int baseWidth, baseHeight;

    Character(NodesBase nodesBase) {
        this.nodesBase = nodesBase;
        baseWidth = this.nodesBase.xAxisNodeNum;
        baseHeight = this.nodesBase.yAxisNodeNum;
    }

    Boolean isShapeUnbounded(int[] location, int[] scope) {
        boolean isUnbounded = false;
        if (location[0] + scope[0] > nodesBase.xAxisNodeNum - 1) {
            isUnbounded = true;
        }
        if (location[1] + scope[1] > nodesBase.yAxisNodeNum - 1) {
            isUnbounded = true;
        }
        return isUnbounded;
    }

    void displayInteractShape() {
        if (interactShape != null) {
            for (int x=0; x<interactShape.length; x++) {
                for (int y=0; y<interactShape[x].length; y++) {
                    interactShape[x][y].display();
                }            
            }
        }        
    }

    void displayNormalShape() {
        if (normalShape != null) {
            for (int x=0; x<normalShape.length; x++) {
                for (int y=0; y<normalShape[x].length; y++) {
                    normalShape[x][y].display();
                }            
            }
        }        
    }

    void displayAllShapes() {
        displayInteractShape();
        displayNormalShape();
    }

    void triggerInteractShape(int x, int y) {
        interactShape[x][y].trigger();
    }

    void triggerNormalShape(int x, int y) {
        normalShape[x][y].trigger();
    }
}
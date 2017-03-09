class Shape{
    NodesBase nodesBase;
    int[] scope;
    int[] initLocate, locate;
    Node [][] nodes;
  
    Shape(NodesBase nodesBase, int[] scope, int[] locate){
        this.nodesBase = nodesBase;
        this.scope = scope;
        this.initLocate = locate;
        this.locate = locate;
        nodes = new Node[scope[0]][scope[1]];
        shapeInitialize();
    }

    void setShape(int[] locate) {
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                int nodeIdX = locate[0] + x;
                int nodeIdY = locate[1] + y;
                nodes[x][y] = nodesBase.nodes[nodeIdX][nodeIdY];
            }
        }
    }

    void shapeInitialize() {
        setShape(this.initLocate);
    }

    void moveX(int speed){
        // TODO 防呆
        this.locate[0] += speed;
        setShape(this.locate);
    }

    void moveY(int speed){
        // TODO 防呆
        this.locate[1] += speed;
        setShape(this.locate);
    }

    void moveXY(int speedX, int speedY) {
        this.locate[0] += speedX;
        this.locate[1] += speedY;
        setShape(this.locate);
    }

    void setMotion(){

    }
}

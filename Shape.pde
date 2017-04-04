class Shape{
    NodesBase nodesBase;
    int[] scope;
    int[] initLocate, locate;
    Node [][] nodes;

    boolean playing = false;
    boolean recovering = false;

    int playingTime = 0;
    int timeLength = int(frameRate * 10);

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
        shapeReset();
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

    void shapeReset() {
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                this.nodes[x][y].resetNode();
            }
        }        
    }

    void recover() {
        if (this.recovering) {
            for (int x=0; x<this.scope[0]; x++) {
                for (int y=0; y<this.scope[1]; y++) {
                    this.nodes[x][y].recover();
                }
            }
        }

        this.recovering = false;
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                if (this.nodes[x][y].recovering == true) {
                    this.recovering = true;
                    break;
                }
            }
        }
    }

    void changeRecoverSpeed(float speed) {
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                this.nodes[x][y].changeRecoverSpeed(speed);
            }
        }
    }

    void changeInteractTimeLength(int second) {
        this.timeLength = int(frameRate * second);
    }

    void display() {
        if (this.playing) {
            motion();
            
            this.playingTime ++;
            if (this.playingTime > this.timeLength) {
                this.playingTime = 0;
                this.playing = false;
                this.recovering = true;
            }
        }
        if (this.recovering) {
            recover();            
        }
    }

    void motion() {
        // for overwrite
    }

    void trigger() {
        if (!this.playing && !this.recovering) {
            this.playing = true;
        }
    }
}
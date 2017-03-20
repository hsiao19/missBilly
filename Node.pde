class Node extends PVector {
    // PVector docs: https://processing.org/reference/PVector.html

    int[] id; //[x, y]
    float initX, initY, initZ;

    Node(int[] id, float x, float y, float z) {
        super(x, y, z);
        this.id = id;
        this.initX = x;
        this.initY = y;
        this.initZ = z;  
    }

    void getVertex() {
        vertex(this.x, this.y, this.z);
    }

    void resetNode() {
        this.set(this.initX, this.initY, this.initZ);
    }
}
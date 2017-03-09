class Node extends PVector {
    // PVector docs: https://processing.org/reference/PVector.html

    int[] id; //[x, y]

    Node(int[] id, float x, float y, float z) {
        super(x, y, z);
        this.id = id;        
    }

    void getVertex() {
        vertex(this.x, this.y, this.z);
    }
}
class Node {
    int[] id;
    float x, y, z;

    Node(int[] id, float x, float y, float z) {
        this.id = id;
        this.x = x;
        this.y = y;
        this.z = z;
    }

    void getVertex() {
        vertex(this.x, this.y, this.z);
    }

    void modifyXYZ(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    void modifyX() {
        this.x = x;
    }

    void modifyY() {
        this.y = y;
    }

    void modifyZ() {
        this.z = z;
    }
}
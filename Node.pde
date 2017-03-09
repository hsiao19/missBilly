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

    void moveXYZ(float speedX, float speedY, float speedZ) {
        this.x += speedX;
        this.y += speedY;
        this.z += speedZ;
    }

    void moveX() {
        this.x += speedX;
    }

    void moveY() {
        this.y += speedY;
    }

    void moveZ() {
        this.z += speedZ;
    }
}
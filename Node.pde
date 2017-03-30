class Node extends PVector {
    // PVector docs: https://processing.org/reference/PVector.html

    int[] id; //[x, y]
    float initX, initY, initZ;
    PVector initVector;
    float recoverSpeed = 1;

    Node(int[] id, float x, float y, float z) {
        super(x, y, z);
        this.id = id;
        this.initX = x;
        this.initY = y;
        this.initZ = z;  
        initVector = new PVector(initX, initY, initZ);
    }

    void getVertex() {
        vertex(this.x, this.y, this.z);
    }

    void resetNode() {
        this.set(this.initVector);
    }

    void recover() {
        float vx = 0;
        float vy = 0;
        float vz = 0;
        if (this.x != this.initX) {
            vx = _getAxisRecoverValue(this.x, this.initX);
        }
        if (this.y != this.initY) {
            vy = _getAxisRecoverValue(this.y, this.initY);
        }
        if (this.z != this.initZ) {
            vz = _getAxisRecoverValue(this.z, this.initZ);
        }
        PVector v = new PVector(vx, vy, vz);
        this.add(v);
    }

    float _getAxisRecoverValue(float value, float initValue) {
        float distance = value - initValue;
        if (distance > 0) {
            if (distance > this.recoverSpeed) {
                return -this.recoverSpeed;
            }
            else {
                return -distance;
            }
        }
        else if (distance < 0) {
            if (distance < -this.recoverSpeed) {
                return this.recoverSpeed;
            }
            else {
                return distance;
            }
        }
        return 0;
    }

    void changeRecoverSpeed(float speed) {
        this.recoverSpeed = speed;
    }
}
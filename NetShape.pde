class NetNormalShape extends Shape {
  NetNormalShape(NodesBase nodesBase, int[] scope, int[] locate) {
    super(nodesBase, scope, locate);
  }
}

class NetInteractShape extends Shape {
  NetInteractShape(NodesBase nodesBase, int[] scope, int[] locate) {
    super(nodesBase, scope, locate);
  }

    void fall() {
        int scopeX = this.scope[0];
        int scopeY = this.scope[1];
        float scopeXMid = scopeX / 2;
        float scopeYMid = scopeY / 2;

        float gravity = 0.2;

        for (int x=0; x<scopeX; x++) {

            // float adjustmentX = sin(map(x, 0, scopeX-1, 0, TWO_PI));

            int adjustmentX = 0;
            if (x + 1 < scopeXMid) {
                adjustmentX = x;
            }
            else {
                adjustmentX = scopeX - x - 1;
            }

            for (int y=0; y<scopeY; y++) {

                // float adjustmentY = sin(map(y, 0, scopeY-1, 0, TWO_PI));

                // float adjustment = adjustmentX + adjustmentY;
                int adjustmentY = 0;
                if (y + 1 < scopeYMid) {
                    adjustmentY = y;
                }
                else {
                    adjustmentY = scopeY - y - 1;
                }

                int adjustment = adjustmentX + adjustmentY;

                // float a = sin(random(PI * 2)) * random(10);

                // PVector newSpeed = this.nodes[x][y].speed.add(
                //     new PVector(0, 0, adjustment * gravity * (-1)));
                // this.nodes[x][y].changeNodeSpeed(newSpeed);

                // this.nodes[x][y].mult(adjustment);
                this.nodes[x][y].add(new PVector(0, 0, -adjustment));
            }
        }      
    }

    void motion() {
        fall();
    }
}
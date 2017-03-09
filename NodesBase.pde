class NodesBase {
    int xAxisNodeNum = ceil(width / MESH_WIDTH) + 1;
    int yAxisNodeNum = ceil(height / MESH_HEIGHT) + 1;
    float nodeInitDist = MESH_HEIGHT;
    
    Node[][] nodes;

    NodesBase() {
        nodes = new Node[xAxisNodeNum][yAxisNodeNum];
        nodesInitialize();
    }

    /* 節點初始化 */
    void nodesInitialize() {
        for (int x=0; x<xAxisNodeNum; x++) {
            for (int y=0; y<yAxisNodeNum; y++) {
                int[] nodeId = {x, y};
                float coordinateX = nodeInitDist * x;
                float coordinateY = nodeInitDist * y;
                float coordinateZ = 0;

                nodes[x][y] = new Node(nodeId, 
                                       coordinateX, 
                                       coordinateY, 
                                       coordinateZ);
            }
        }
    }
}

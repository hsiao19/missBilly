class Character {
    NodesBase nodesBase;

    Character(NodesBase nodesBase) {
        this.nodesBase = nodesBase;
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
}
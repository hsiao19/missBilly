class ExampleShape extends BaseShape {

	ExampleShape(NodesBase nodesBase, int[] scope, int[] locate) {
		super(nodesBase, scope, locate);
	}

	void addDepth() {
		for (int x=0; x<this.scope[0]; x++) {
			for (int y=0; y<this.scope[1]; y++) {
				nodes[x][y].add(0, 0, -1);
			}
		}
	}
}

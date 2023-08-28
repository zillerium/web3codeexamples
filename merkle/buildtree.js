class MerkleTree {
    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot() {
        return this._buildTree(this.leaves)[0];
    }

    _buildTree(nodes) {
        if (nodes.length === 1) {
            return nodes;
        }

        const newNodes = [];
        for (let i = 0; i < nodes.length; i += 2) {
            const leftNode = nodes[i];
            const rightNode = nodes[i + 1] || ''; // If odd number of nodes, pad with an empty string
            newNodes.push(this.concat(leftNode, rightNode));
        }

        return this._buildTree(newNodes);
    }
}

module.exports = MerkleTree;

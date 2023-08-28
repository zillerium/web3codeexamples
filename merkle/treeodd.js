class MerkleTree {
    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot() {
        const nodes = this._buildTree(this.leaves);
        return nodes[0];
    }

    _buildTree(nodes) {
        if (nodes.length === 1) {
            return nodes;
        }

        const newNodes = [];
        for (let i = 0; i < nodes.length; i += 2) {
            const leftNode = nodes[i];
            const rightNode = nodes[i + 1] || ''; // Use empty string for odd number of nodes
            if (rightNode === '') {
                newNodes.push(leftNode);
            } else {
                newNodes.push(this.concat(leftNode, rightNode));
            }
        }

        return this._buildTree(newNodes);
    }
}

module.exports = MerkleTree;

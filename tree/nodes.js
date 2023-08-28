class Node {
    constructor(data) {
        this.data = data;
        this.left = null;
        this.right = null;
    }
}

class Tree {
    constructor() {
        this.root = null;
    }

    addNode(node){
        let newNode = node;
        if(this.root === null){
            this.root = newNode;
            console.log("root ", this.root.data);
        } else {
            this.insertNode(this.root, newNode);
        }
        console.log("root final", this.root)
    }

    insertNode(node, newNode) {
        if(newNode.data < node.data) {
            node.left = newNode;
            node.left.data = newNode.data;
            console.log("left =", node.left);
        } else {
          
            node.right = newNode;
            node.right.data = newNode.data;
            console.log("right =", node.right);
        }
    }
}

module.exports = Tree;
 

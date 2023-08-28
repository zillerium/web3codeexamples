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

insertNode(parent, newNode) {
        if (newNode.data < parent.data) {
            if (parent.left === null) {
                parent.left = new Node(newNode.data);
            } else {
                this.insertNode(parent.left, newNode);
            }
        } else {
            if (parent.right === null) {
                parent.right = new Node(newNode.data);
            } else {
                this.insertNode(parent.right, newNode);
            }
        }
    }

    insertNode1(parent, child) {
       
        if(child.data < parent.data) {
            if (parent.left === null) { } else { 
                console.log("left node == ", parent.left);
                this.insertNode(parent.left, child);
            }
            parent.left = child;
            parent.left.data = child.data;
            console.log("left =", child.left);
        } else {
            if (parent.right === null) {} else {
                 console.log("right node == ", parent.right);

                 this.insertNode(parent.right, child);
            }
            parent.right = child;
            parent.right.data = child.data;
            console.log("right =", child.right);
        }
        console.log("parent node = ", parent)
    }
}

module.exports = Tree;
 

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

hasNode(number) {
    return this.checkNode(this.root, number);
}
 
 checkNode(parent, number) {
        if (parent === null) return false;
          console.log(" number  = ", number)

     console.log("parent node = ", parent)
       console.log("parent number = ", parent.data)
     
        if (parent.data === number) { 
            console.log(" parent node check passed")
            return true;
        }
        if (number < parent.data) {
            return this.checkNode(parent.left, number);
        } else {
            return this.checkNode(parent.right, number);
        }
    }

checkNode1(parent, number ) {
    if (parent === null) return false;
    if (parent.data === number) return true;
    if  (parent.right != null && parent.right.data < number) 
         this.checkNode(parent.left, number)
    else this.checkNode(parent.right, number);
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

  
}

module.exports = Tree;
 

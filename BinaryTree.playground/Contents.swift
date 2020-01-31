class BinaryTreeNode {
    let key: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    init() {
        self.key = -1
        self.left = nil
        self.right = nil
    }
}

func inorderTraversal(tree: BinaryTreeNode?) {
    if let tree = tree {
        inorderTraversal(tree: tree.left)
        print("\(tree.key)", terminator: "")
        inorderTraversal(tree: tree.right)
    }
}

func searchTree(tree: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
    if let tree = tree {
        if tree.key == value {
            return tree
        } else if value < tree.key {
            return searchTree(tree: tree.left, value: value)
        } else {
            return searchTree(tree: tree.right, value: value)
        }
    } else {
        return tree
    }
}

func treeMinimum(tree: BinaryTreeNode?) -> BinaryTreeNode? {
    if let tree = tree, let leftTree = tree.left {
        return treeMinimum(tree: leftTree)
    } else {
        return tree
    }
}


func treeMaximum(tree: BinaryTreeNode?) -> BinaryTreeNode? {
    if let tree = tree, let rightTree = tree.right {
        return treeMaximum(tree: rightTree)
    } else {
        return tree
    }
}

func nodeSuccessor(tree: BinaryTreeNode?, node: BinaryTreeNode?) -> BinaryTreeNode? {
    
    if let tree = tree {
        if let rightSubTree = tree.right {
            return treeMinimum(tree: rightSubTree)
        } else {
            var successor: BinaryTreeNode? = nil
            var root: BinaryTreeNode? = tree
            while root != nil {
                if let node = node, let tempRoot = root {
                    if node.key < tempRoot.key {
                        successor = root
                        root = tempRoot.left
                    } else if node.key > tempRoot.key {
                        root = tempRoot.right
                    } else {
                        break
                    }
                }
            }
            return successor
        }
    } else {
        return tree
    }
}

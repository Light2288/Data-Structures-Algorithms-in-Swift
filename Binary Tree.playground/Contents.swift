import UIKit

func example(of description: String, completion: () -> Void) {
    print("\n\nExample of \(description)\n")
    completion()
}

var tree: BinaryNode<Int> = {
    let node50 = BinaryNode(value: 50)
    let node150 = BinaryNode(value: 150)
    let node70 = BinaryNode(value: 70)
    let node80 = BinaryNode(value: 80)
    let node120 = BinaryNode(value: 120)
    let node140 = BinaryNode(value: 140)
    let node10 = BinaryNode(value: 10)
    let node30 = BinaryNode(value: 30)
    let node40 = BinaryNode(value: 40)
    let node45 = BinaryNode(value: 45)
    let node0 = BinaryNode(value: 0)
    let node5 = BinaryNode(value: 5)
    let node2 = BinaryNode(value: 2)
    let node18 = BinaryNode(value: 18)
    
    node50.leftChild = node40
    node40.rightChild = node45
    node40.leftChild = node10
    node10.rightChild = node30
    node10.leftChild = node2
    node2.leftChild = node0
    node2.rightChild = node5
    node10.rightChild = node18
    node50.rightChild = node70
    node70.rightChild = node140
    node140.rightChild = node150
    node140.leftChild = node120
    node120.leftChild = node80
    
    return node50
}()

example(of: "tree diagram") {
    print(tree)
}

example(of: "in-order traversal") {
    tree.traverseInOrder { print($0.value) }
}


example(of: "pre-order traversal") {
    tree.traversePreOrder { print($0.value) }
}

example(of: "post-order traversal") {
    tree.traversePostOrder { print($0.value) }
}

example(of: "height calculation") {
    print(tree.height)
}


example(of: "serialization") {
    let array = tree.serialize()
    print(array)
    print("\n\n\n")
    let recreatedTree = array.toBinaryTree()
    print(recreatedTree!)
}


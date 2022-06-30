import Foundation

extension BinaryNode {
    public var height: Int {
        return self.rightChild == nil && self.leftChild == nil ? 0 : 1 + max(self.leftChild?.height ?? 0, self.rightChild?.height ?? 0)
    }
}

extension BinaryNode {
    public func traversePreOrderWithNil(visit: (BinaryNode?) -> Void) {
        visit(self)
        if let leftChild = self.leftChild {
            leftChild.traversePreOrderWithNil(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = self.rightChild {
            rightChild.traversePreOrderWithNil(visit: visit)
        } else {
            visit(nil)
        }
    }
}

extension BinaryNode {
    public func serialize() -> [Element?] {
        var serializedTree: [Element?] = []
        self.traversePreOrderWithNil { serializedTree.append($0?.value ?? nil) }
        return serializedTree
    }
}

extension Array {
    public func toBinaryTree<T>() -> BinaryNode<T>? where Element == T? {
        var reversedArray = Array(self.reversed())
        return(deserialize(&reversedArray))
    }
    
    func deserialize<T>(_ array: inout Array<T?>) -> BinaryNode<T>? {
        guard !array.isEmpty, let value = array.removeLast() else {
            return nil
        }
        let node = BinaryNode(value: value)
        node.leftChild = deserialize(&array)
        node.rightChild = deserialize(&array)
        return node
    }
}

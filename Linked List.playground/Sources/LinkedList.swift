import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        self.head == nil
    }
    
}


// MARK: - CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = self.head else { return "Empty list" }
        return String(describing: head)
    }
    
}


// MARK: - Push operation
extension LinkedList {
    public mutating func push(_ value: Value) {
        self.head = Node(value: value, next: head)
        if self.tail == nil {
            self.tail = self.head
        }
        
    }
}


// MARK: - Append operation
extension LinkedList {
    public mutating func append(_ value: Value) {
        self.copyNodes()
        guard !self.isEmpty else {
            self.push(value)
            return
        }
        self.tail!.next = Node(value: value)
        self.tail = self.tail!.next
    }
}


// MARK: - Insert after index/element operation
extension LinkedList {
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = self.head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        self.copyNodes()
        guard self.tail !== node else {
            append(value)
            return self.tail!
        }
        
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    public mutating func insert(_ value: Value, after index: Int) {
        self.copyNodes()
        guard let node = self.node(at: index) else { return }
        guard self.tail !== node else {
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
}


// MARK: - Pop operation
extension LinkedList {
    @discardableResult
    public mutating func pop() -> Value? {
        self.copyNodes()
        defer {
            self.head = self.head?.next
            if self.isEmpty {
                self.tail = nil
            }
        }
        return self.head?.value
    }
}


// MARK: - Remove last element operation
extension LinkedList {
    @discardableResult
    public mutating func removeLast() -> Value? {
        self.copyNodes()
        guard let head = self.head else { return nil }
        
        guard head.next != nil else { return self.pop() }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        self.tail = prev
        return current.value
    }
}


// MARK: - Remove after specific element/index
extension LinkedList {
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = self.copyNodes(returningCopyOf: node) else { return nil }
        defer {
            if node.next === self.tail {
                self.tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    @discardableResult
    public mutating func remove(after index: Int) -> Value? {
        self.copyNodes()
        guard let node = self.node(at: index) else { return nil }
        defer {
            if node.next === self.tail {
                self.tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}


// MARK: - Collection extension
extension LinkedList: Collection {
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func == (lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let(left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        Index(node: self.head)
    }
    
    public var endIndex: Index {
        Index(node: self.tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
}


// MARK: - Adding COW
extension LinkedList {
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = self.head else { return }
        self.head = Node(value: oldNode.value)
        var newNode = self.head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        self.tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else { return nil }
        guard var oldNode = self.head else { return nil }
        self.head = Node(value: oldNode.value)
        var newNode = self.head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        self.tail = newNode
        return nodeCopy
    }
}

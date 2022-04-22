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
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
        
    }
}


// MARK: - Append operation
extension LinkedList {
    public mutating func append(_ value: Value) {
        guard !self.isEmpty else {
            self.push(value)
            return
        }
        self.tail!.next = Node(value: value)
        self.tail = self.tail!.next
    }
}


// MARK: - Insert after operation
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
        guard self.tail !== node else {
            append(value)
            return self.tail!
        }
        
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    public mutating func insert(_ value: Value, after index: Int) {
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
        defer {
            self.head = self.head?.next
            if self.isEmpty {
                tail = nil
            }
        }
        return self.head?.value
    }
}


// MARK: - Remove last element operation
extension LinkedList {
    @discardableResult
    public mutating func removeLast() -> Value? {
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


// MARK: - Remove after specific index
extension LinkedList {
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
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

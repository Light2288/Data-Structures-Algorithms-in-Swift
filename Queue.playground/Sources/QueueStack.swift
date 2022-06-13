import Foundation

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        self.leftStack.isEmpty && self.rightStack.isEmpty
    }
    
    public var peek: T? {
        !self.leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        self.rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if self.leftStack.isEmpty {
            self.leftStack = self.rightStack.reversed()
            self.rightStack.removeAll()
        }
        return self.leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
}

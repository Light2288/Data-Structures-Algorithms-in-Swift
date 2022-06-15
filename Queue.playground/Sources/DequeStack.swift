import Foundation

public struct DequeStack<T>: Deque {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        self.leftStack.isEmpty && self.rightStack.isEmpty
    }
    
    public func peek(from direction: Direction) -> T? {
        switch direction {
        case .front:
            return !self.leftStack.isEmpty ? leftStack.last : rightStack.first
        case .back:
            return !self.rightStack.isEmpty ? rightStack.last : leftStack.first
        }
    }
    
    public mutating func enqueue(_ element: T, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            self.leftStack.append(element)
        case .back:
            self.rightStack.append(element)
        }
        return true
    }
    
    public mutating func dequeue(from direction: Direction) -> T? {
        switch direction {
        case .front:
            if self.leftStack.isEmpty {
                self.leftStack = self.rightStack.reversed()
                self.rightStack.removeAll()
            }
            return self.leftStack.popLast()
        case .back:
            if !self.rightStack.isEmpty {
                return rightStack.popLast()
            } else {
                return self.leftStack.removeFirst()
            }
        }
    }
}

extension DequeStack: CustomStringConvertible {
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
}

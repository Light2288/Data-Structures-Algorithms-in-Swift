import Foundation

public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        self.array.isEmpty
    }
    
    public var peek: T? {
        self.array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        self.array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        self.isEmpty ? nil : self.array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: self.array)
    }
}

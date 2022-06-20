import Foundation

public class DequeLinkedList<T>: Deque {
        
    public typealias Element = T
    
    private var list = DoublyLinkedList<T>()
    
    public init() {}
    
    public func enqueue(_ element: T, to direction: Direction) -> Bool {
        switch direction {
        case .front:
            self.list.insert(element)
            return true
        case .back:
            self.list.append(element)
            return true
        }
    }
    
    public func dequeue(from direction: Direction) -> T? {
        let element = direction == .front ? self.list.first : self.list.last
        guard !self.list.isEmpty, let element = element else {
            return nil
        }
        return self.list.remove(element)
    }
    
    public func peek(from direction: Direction) -> T? {
        switch direction {
        case .front:
            return self.list.first?.value
        case .back:
            return self.list.last?.value
        }
    }
    
    public var isEmpty: Bool {
        self.list.isEmpty
    }
}

extension DequeLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: self.list)
    }
}

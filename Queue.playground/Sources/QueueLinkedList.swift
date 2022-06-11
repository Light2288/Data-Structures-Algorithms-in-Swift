import Foundation

public class QueueLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        self.list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !self.list.isEmpty, let element = self.list.first else {
            return nil
        }
        
        return self.list.remove(element)
    }
    
    public var peek: T? {
        self.list.first?.value
    }
    
    public var isEmpty: Bool {
        self.list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: self.list)
    }
}

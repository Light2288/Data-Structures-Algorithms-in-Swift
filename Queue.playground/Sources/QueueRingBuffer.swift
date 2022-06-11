import Foundation

public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        self.ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        self.ringBuffer.isEmpty
    }
    
    public var peek: T? {
        self.ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        self.ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        self.ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: self.ringBuffer)
    }
}

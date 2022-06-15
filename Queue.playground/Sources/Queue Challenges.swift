import Foundation

protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueStack: BoardGameManager {
    public typealias Player = T
    
    mutating public func nextPlayer() -> T? {
        guard let player = self.dequeue() else { return nil }
        let _ = self.enqueue(player)
        return player
    }
}

extension QueueStack {
    public func reversed() -> QueueStack {
        var queue = self
        var stack: Stack<T> = Stack()
        while let element = queue.dequeue() {
            stack.push(element)
        }
        while let element = stack.pop() {
            let _ = queue.enqueue(element)
        }
        return queue
    }
}

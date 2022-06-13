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

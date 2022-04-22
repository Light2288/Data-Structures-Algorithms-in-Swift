import Foundation

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}


// MARK: - CustomStringConvertible
extension Node: CustomStringConvertible {
    public var description: String {
        guard let nextNode = self.next else { return "\(self.value)" }
        return "\(self.value) -> " + String(describing: nextNode) + " "
    }
}

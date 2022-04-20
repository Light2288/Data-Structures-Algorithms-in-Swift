import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() {}
}


// MARK: - CustomDebugStringConvertible
extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ----top----
        \(self.storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}


// MARK: - Push element
extension Stack {
    public mutating func push(_ element: Element) {
        self.storage.append(element)
    }
}


// MARK: - Pop element
extension Stack {
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
}

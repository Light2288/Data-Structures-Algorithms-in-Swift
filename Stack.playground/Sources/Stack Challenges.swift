import Foundation

// MARK: - Use stack to print content of array in reversed order
public func printReversed<Element>(array: [Element]) {
    var stack = Stack<Element>(array)
    while !stack.isEmpty {
        print(stack.pop()!)
    }
}


// MARK: - Use stack to check for balanced parentheses
public func checkBalancedParenteses(in string: String) -> Bool {
    var stack = Stack<Character>()
    for char in string {
        if char == "(" {
            stack.push(char)
        } else if char == ")" {
            guard let _ = stack.pop() else { return false }
        }
    }
    return stack.isEmpty
}

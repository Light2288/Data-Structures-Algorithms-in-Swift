import UIKit

func example(of description: String, closure: () -> Void) {
    print("\n\nExample of \(description)\n")
    closure()
}

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
    
    if let lastElement = stack.peek() {
        print(lastElement)
    }
    
    print(stack.isEmpty)
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") {
    var stack = Stack([1.0, 2.0, 3.0, 4.0])
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from variadic params") {
    var stack = Stack(1, 2, 3, 4)
    print(stack)
    stack.pop()
}



// MARK: - Challenges
print("\n\n ---- Challenges ----\n")
printReversed(array: [1, 2, 3])

print(checkBalancedParenteses(in: "h((e))llo(world)()((!()))"))
print(checkBalancedParenteses(in: "h((ello) world!"))
print(checkBalancedParenteses(in: "h))((e))llo(world)()((!()))(("))

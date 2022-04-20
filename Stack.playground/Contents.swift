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

import UIKit

func example(of description: String, closure: () -> Void) {
    print("Example of \(description)\n")
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

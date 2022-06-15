import UIKit

func example(of description: String, completion: () -> Void) {
    print("\n\nExample of \(description)\n")
    completion()
}

example(of: "creating a queue implemented with array") {
    var queue: QueueArray<String> = QueueArray<String>()

    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    print(queue.peek ?? "Queue is empty")
}

example(of: "creating a queue implemented with doubly linked list") {
    let queue: QueueLinkedList<String> = QueueLinkedList<String>()

    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    print(queue.peek ?? "Queue is empty")
}

example(of: "creating a queue implemented with ring buffer") {
    var queue: QueueRingBuffer<String> = QueueRingBuffer<String>(count: 10)

    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    print(queue.peek ?? "Queue is empty")
}

example(of: "creating a queue implemented with double stack") {
    var queue: QueueStack<String> = QueueStack<String>()

    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    print(queue.peek ?? "Queue is empty")
}


// MARK: - Challenges
print("\n\n ---- Challenges ----\n")
var queue: QueueStack<String> = QueueStack<String>()
queue.enqueue("Player 1")
queue.enqueue("Player 2")
queue.enqueue("Player 3")
queue.enqueue("Player 4")
queue.enqueue("Player 5")
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)
print(queue.nextPlayer()!)

var reverseQueue: QueueStack<Int> = QueueStack<Int>()
reverseQueue.enqueue(1)
reverseQueue.enqueue(2)
reverseQueue.enqueue(3)
reverseQueue.enqueue(4)
print(reverseQueue)
print(reverseQueue.reversed())


var dequeStack: DequeStack<Int> = DequeStack<Int>()
dequeStack.enqueue(1, to: .back)
dequeStack.enqueue(2, to: .back)
dequeStack.enqueue(3, to: .back)
dequeStack.enqueue(4, to: .back)
dequeStack.enqueue(0, to: .front)
print(dequeStack)
print(dequeStack.peek(from: .front)!)
print(dequeStack.peek(from: .back)!)
dequeStack.dequeue(from: .front)
print(dequeStack)
dequeStack.dequeue(from: .back)
print(dequeStack)
dequeStack.dequeue(from: .front)
print(dequeStack)
dequeStack.dequeue(from: .back)
print(dequeStack)

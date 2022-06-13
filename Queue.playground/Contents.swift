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

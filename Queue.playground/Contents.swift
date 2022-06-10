import UIKit

func example(of description: String, completion: () -> Void) {
    print("\n\nExample of \(description)\n")
    completion()
}

example(of: "creating a queue from array") {
    var queue: QueueArray<String> = QueueArray<String>()

    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    print(queue.peek ?? "Queue is empty")
}

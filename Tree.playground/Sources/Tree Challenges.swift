import Foundation

extension TreeNode {
    public func forEachLevelPrint(separator: String, visit: ((TreeNode, Int)) -> Void) {
        visit((self, 0))
        print(separator)
        var queue = Queue<(element: TreeNode, level: Int)>()
        self.children.forEach { queue.enqueue(($0, 1)) }
        while let queueElement = queue.dequeue() {
            visit((queueElement.element, queueElement.level))
            if queueElement.level != queue.peek?.level {
                print(separator)
            }
            queueElement.element.children.forEach { queue.enqueue(($0, queueElement.level + 1)) }
        }
    }
}

import Foundation

extension LinkedList {
    public mutating func printReversed() {
        while !self.isEmpty {
            print(self.removeLast()!)
        }
    }
}

func printInReverse<Value> (_ node: Node<Value>?) {
    guard let node = node else { return }
    printInReverse(node.next)
    print(node.value)
}

extension LinkedList {
    public func printInReverse() {
        Linked_List_Sources.printInReverse(self.head)
    }
}

extension LinkedList {
    public func findMiddleNode() -> Value? {
        var count = 1
        guard let head = self.head else { return nil }
        
        guard head.next != nil else { return self.head!.value }
        
        var current = head
        while let next = current.next {
            current = next
            count += 1
        }
        return self.node(at: count/2)!.value
    }
}

public func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    return slow
}

extension LinkedList {
    mutating public func reverse() {
        self.tail = self.head
        var prev = self.head
        var current = self.head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        self.head = prev
    }
}

public func mergeSortedLists<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else { return right }
    guard !right.isEmpty else { return left }
    
    var mergedList = LinkedList<T>()
    var currentLeftNode = left.head
    var currentRightNode = right.head
    while let leftNode = currentLeftNode, let rightNode = currentRightNode {
        mergedList.append(min(leftNode.value, rightNode.value))
        if leftNode.value < rightNode.value {
            currentLeftNode = currentLeftNode?.next
        } else {
            currentRightNode = currentRightNode?.next
        }
    }
    while currentLeftNode != nil {
        mergedList.append(currentLeftNode!.value)
        currentLeftNode = currentLeftNode?.next
    }
    while currentRightNode != nil {
        mergedList.append(currentRightNode!.value)
        currentRightNode = currentRightNode?.next
    }
    
    return mergedList
}


extension LinkedList where Value: Equatable {
  
  public mutating func removeOccurences(of value: Value) {
    while let head = self.head, head.value == value {
      self.head = head.next
    }
    var prev = head
    var current = head?.next
    while let currentNode = current {
      guard currentNode.value != value else {
        prev?.next = currentNode.next
        current = prev?.next
        continue
      }
      prev = current
      current = current?.next
    }
    tail = prev
  }
}

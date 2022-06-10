import UIKit

func example(of description: String, completion: () -> Void) {
    print("\n\nExample of \(description)\n")
    completion()
}

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}


example(of: "inserting at a particular index") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before inserting< \(list)")
    
    var middleNode = list.node(at: 1)!
    
    for i in 10...14 {
        middleNode = list.insert(i, after: middleNode)
    }
    
    print("After inserting: \(list)")
    
    for i in 0...4 {
        list.insert(i+20, after: i+1)
    }
    
    print("After second inserting: \(list)")
}


example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before popping list: \(list)")
    
    let poppedValue = list.pop()
    
    print("After popping list: \(list)")
    print("Popped value: \(String(describing: poppedValue))")
}


example(of: "removing the last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing last node: \(list)")
    
    let removedValue = list.removeLast()
    
    print("After removing last node: \(list)")
    print("Removed value: \(String(describing: removedValue))")
}


example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    list.push(5)
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing: \(list)")
    
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    
    print("After removing: \(list)")
    print("Removed value: \(String(describing: removedValue))")
    
    let secondRemovedValue = list.remove(after: index)
    print("After second removing: \(list)")
    print("Second removed value: \(String(describing: secondRemovedValue))")
}


example(of: "using collections") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

example(of: "linked list cow") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    var list2 = list1
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("After appending 3 to list2")
    list2.append(3)
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("Removing middle node on list2")
    if let node = list2.node(at: 0) {
        list2.remove(after: node)
    }
    print("List2: \(list2)")
    
    list2.append(4)
    print("List2: \(list2)")
    print("Removing middle node on list2")
    list2.remove(after: 0)
    print("List2: \(list2)")
    
    print("After pushing 0 to list1 and -1 to list2")
    list1.push(0)
    list2.push(-1)
    print("List1: \(list1)")
    print("List2: \(list2)")
}


// MARK: - Challenges
print("\n\n ---- Challenges ----\n")

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
list.printReversed()

print("\n")
var list1 = LinkedList<Int>()
list1.push(3)
list1.push(2)
list1.push(1)
list1.printInReverse()

print("\n")
let middleNodeList1 = LinkedList<Int>()
print(middleNodeList1.findMiddleNode() ?? "List is empty")
var middleNodeList2 = LinkedList<Int>()
middleNodeList2.push(3)
middleNodeList2.push(2)
middleNodeList2.push(1)
print(middleNodeList2.findMiddleNode()!)
print(getMiddle(middleNodeList2)!.value)
var middleNodeList3 = LinkedList<Int>()
middleNodeList3.push(4)
middleNodeList3.push(3)
middleNodeList3.push(2)
middleNodeList3.push(1)
print(middleNodeList3.findMiddleNode()!)
print(getMiddle(middleNodeList3)!.value)

print("\n")
var reverseList = LinkedList<Int>()
reverseList.push(3)
reverseList.push(2)
reverseList.push(1)
print("Original list: \(reverseList)")
reverseList.reverse()
print("Reversed list: \(reverseList)")

print("\n")
var left = LinkedList<Int>()
left.push(11)
left.push(10)
left.push(4)
left.push(1)
var right = LinkedList<Int>()
right.push(6)
right.push(3)
right.push(2)
right.push(-1)
let mergedList = mergeSortedLists(left, right)
print("Merged list: \(mergedList)")

print("\n")
var removeOccurrencesList = LinkedList<Int>()
removeOccurrencesList.push(3)
removeOccurrencesList.push(3)
removeOccurrencesList.push(7)
removeOccurrencesList.push(3)
removeOccurrencesList.push(5)
removeOccurrencesList.push(3)
removeOccurrencesList.push(3)
removeOccurrencesList.push(1)
removeOccurrencesList.push(2)
removeOccurrencesList.push(1)
removeOccurrencesList.push(3)
removeOccurrencesList.push(3)
removeOccurrencesList.push(8)
removeOccurrencesList.push(3)
removeOccurrencesList.push(3)

removeOccurrencesList.removeOccurences(of: 3)
print(removeOccurrencesList)

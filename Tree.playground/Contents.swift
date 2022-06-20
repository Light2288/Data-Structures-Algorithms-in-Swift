import UIKit

func example(of description: String, completion: () -> Void) {
    print("\n\nExample of \(description)\n")
    completion()
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    let tea = TreeNode("Tea")
    let coffee = TreeNode("Coffee")
    let chocolate = TreeNode("Chocolate")
    let blackTea = TreeNode("Black Tea")
    let greenTea = TreeNode("Green Tea")
    let chaiTea = TreeNode("Chai Tea")
    let soda = TreeNode("Soda")
    let milk = TreeNode("Milk")
    let gingerAle = TreeNode("Ginger Ale")
    let bitterLemon = TreeNode("Bitter Lemon")
    
    tree.add(hot)
    tree.add(cold)
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    cold.add(soda)
    cold.add(milk)
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

example(of: "creating a tree") {
    let beverages = TreeNode("Beverages")
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    beverages.add(hot)
    beverages.add(cold)
}

example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst { print($0.value) }
}

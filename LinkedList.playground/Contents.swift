// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "creatint and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(5)
    list.push(4)
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
    var middleNode = list.node(at: 1)!
    print("Before inserting: \(list)")
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)")
}

example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("after popping list: \(list)")
    print("Popped value:  " + String(describing: poppedValue))
}

example(of: "removing last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before removing last node: \(list)")
    let removedValue = list.removeLast()
    print("After removing last node: \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "removing node after a particular node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before removing a particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("After removing a particular index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}

example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    print("list: \(list)")
    print("first element: \(list[list.startIndex])")
    print("array containing first 3 elements: \(Array(list.prefix(3)))")
    print("array containing last 3 elements: \(Array(list.suffix(3)))")

    let sum = list.reduce(0, +)
    print("Sum of all value: \(sum)")
}

example(of: "cow") {
    let array1 = [1, 2]
    var array2 = array1

    print("array1: \(array1)")
    print("array2: \(array2)")

    print("--- after adding 3 to array 2 ---")

    array2.append(3)
    print("array1: \(array1)")
    print("array2: \(array2)")
}

example(of: "linked list cow") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    var list2 = list1
    print("list1: \(list1)")
    print("list2: \(list2)")
    print("--- after appending 3 to list2 ---")
    list2.append(3)
    print("list1: \(list1)")
    print("list2: \(list2)")


    print("list 1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    let list3 = list1
    print("list 3: \(list3)")
    print("list 1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")

    print("Removing middle node on list 2")
    if let node = list2.node(at: 0) {
        list2.remove(after: node)
    }
    print(list2)
}

example(of: "Print reverse nodes") {
    var list = LinkedList<Int>()
    for number in 0...3 { list.append(number) }
    var reversedList = LinkedList<Int>()
    list.forEach { node in
        reversedList.push(node)
    }
    print("list: \(list)")
    print("reversed list: \(reversedList)")
}

example(of: "Find middle node") {
    func middleNode(of list: LinkedList<Int>) {
        let middleIndex = list.count / 2
        let middleNode = list.node(at: middleIndex)
        print("list: \(list)")
        print("middle node: \(String(describing: middleNode!.value))")
    }

    var evenList = LinkedList<Int>()
    for number in 1...4 { evenList.append(number) }
    middleNode(of: evenList)

    var oddList = LinkedList<Int>()
    for number in 1...3 { oddList.append(number) }
    middleNode(of: oddList)
}

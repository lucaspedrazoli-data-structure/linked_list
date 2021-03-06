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

example(of: "Print in reverse") {
    var list = LinkedList<Int>()
    for number in 0...3 { list.append(number) }

    func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else { return }
        printInReverse(node.next)
        print(node.value)
    }
    print("list: \(list)")
    printInReverse(list.head)
}

example(of: "Find middle node -> Runners Technique ") {
    var list = LinkedList<Int>()
    for number in 1...7 { list.append(number) }
    print("list: \(list)")

    var slow = list.head
    var fast = list.head
    while let nextFast = fast?.next {
        fast = nextFast.next
        print("fast: \(fast!.value)")
        slow = slow?.next
        print("slow: \(slow!.value)")
    }

    if let middleNode = slow {
        print("middle node: \(middleNode.value)")
    }
}

example(of: "Reverse a linked list simple way") {
    var list = LinkedList<Int>()
    for number in 0...3 { list.append(number) }
    var reversedList = LinkedList<Int>()
    list.forEach { node in
        reversedList.push(node)
    }
    print("list: \(list)")
    list.head = reversedList.head
    print("reversed list: \(list)")
}

example(of: "Reverse a linked list performance way") {
    //instead of store a temporary list in memory
    //we will work with only 3 linked values
    //and replace the linked value(memory pointer) from these 3 objects
    var list = LinkedList<Int>()
    for number in 0...5 { list.append(number) }
    print("list: \(list)")
    var prev = list.head //value 1
    var current = list.head?.next // value 2
    prev?.next = nil
    while current != nil {
        let next = current?.next //value 3
        current?.next = prev //replace the linked value from var 2
        print("--- iteration init ---")
        print("prev value: \(String(describing: prev?.value))")
        print("current value: \(String(describing: current?.value))")
        print("-------------------------------")
        prev = current // replace the value from var 1
        current = next //replace the value from var 2
        print("--- iteration end ---")
        print("prev value: \(String(describing: prev?.value))")
        print("current value: \(String(describing: current?.value))")
        print("list transformation: \(prev!)")
        print("-------------------------------")
    }
    list.head = prev
    print("reversed: \(list)")
}

example(of: "Merge sorted lists") {
    let array1 = [1, 4, 10, 11, 12]
    let array2 = [1, 2, 3, 6]
    var leftList = LinkedList<Int>()
    var rightList = LinkedList<Int>()
    array1.forEach { leftList.append($0) }
    array2.forEach { rightList.append($0) }

    print("list LEFT: \(leftList)")
    print("list RIGHT: \(rightList)")

    var newList = LinkedList<Int>()
    var currentLeft = leftList.head
    var currentRight = rightList.head

    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newList.append(leftNode.value)
            currentLeft = leftNode.next
        } else {
            newList.append(rightNode.value)
            currentRight = rightNode.next
        }
    }

    if let leftNode = currentLeft {
        newList.append(leftNode.value)
        var tail: Node<Int>? = leftNode
        while let next = tail?.next {
            newList.append(next.value)
            tail = tail?.next
        }
    }

    if let rightNode = currentRight {
        newList.append(rightNode.value)
        var tail: Node<Int>? = rightNode
        while let next = tail?.next {
            newList.append(next.value)
            tail = tail?.next
        }
    }

    print("merged list: \(newList)")
}

example(of: "Remove all ocurrences") {
    let array = [1, 3, 3, 3, 4, 3]
    var list = LinkedList<Int>()
    array.forEach { list.append($0) }
    print("original list: \(list)")
    var newList = LinkedList<Int>()
    var node = list.head

    if let head = list.head, head.value != 3 {
        newList.append(head.value)
    }

    while let next = node?.next {
        if next.value != 3 {
            newList.append(next.value)
        }
        node = node?.next
    }
    print("newlist: \(newList)")
}

example(of: "Remove all ocurrences performatic way") {
    let array = [3, 3, 1, 3, 3, 3, 4, 3, 3, 3, 5, 3]
    var list = LinkedList<Int>()
    array.forEach { list.append($0) }
    print("original list: \(list)")

    let valueToRemove = 3

    while let head = list.head, head.value == valueToRemove {
        list.head = head.next
    }

    var prev = list.head
    var current = list.head?.next
    while current != nil {
        if current!.value == valueToRemove {
            prev?.next = current?.next
            current = current?.next
        } else {
            prev = current
            current = current?.next
        }
    }

    print("updated list: \(list)")
}

# linked_list

### A linked list is a collection of values arranged in a linear unidirectional sequence
A linked list is a chain of nodes. Nodes have two responsibilities:
1. Hold a value.
2. Hold a reference to the next node. A nil value represents the end of the list.

```
public class Node<Value> {
  public var value: Value
  public var next: Node?
  
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}
```

```
public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?
  public init() {}
  public var isEmpty: Bool { head == nil }
}
```

### operations
1. push: Adds a value at the front of the list.
2. append: Adds a value at the end of the list.
3. insert(after:): Adds a value after a particular node of the list.
4. pop: Removes the value at the front of the list.
5. removeLast: Removes the value at the end of the list.
6. remove(after:)

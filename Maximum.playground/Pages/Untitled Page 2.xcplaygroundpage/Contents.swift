//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
 Odd Even Linked List
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

 Example 1:

 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 Example 2:

 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 */

public class Node {
    var value: String
    var next: Node?
    weak var previous: Node?

    init(value: String) {
      self.value = value
    }
    
    public func insertFromInto(to: Node){
        to.next?.next = self.next
        self.previous = to.next?.previous
        to.next = self.previous
    }

}

public class LinkedList {
    fileprivate var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public var count: Int? {
        guard var current = head else{
            return 0
        }
        var count = 0
        while let next = current.next {
            current = next
            count += 1
        }
        return count
    }
    
    public func append(value: String) {
        let newNode = Node(value: value)
        if let trilNode = tail {
            newNode.previous = trilNode
            trilNode.next = newNode
        }else {
            head = newNode
        }
        
        tail = newNode
    }
}

public func makeListToOddEven(_ list: LinkedList) {
    var evenHead = list.first
    var startIndex = (list.count ?? 0) > 2 ? 0 : -1
    guard var currentNode = list.head else{
        return
    }
    
    while let next = currentNode.next {
        currentNode = next
        if (startIndex % 2 != 0) && (startIndex != 0)  {
            if let evenHead_ = evenHead {
                next.insertFromInto(to: evenHead_)
            }
            evenHead = evenHead?.next
        }
        startIndex += 1
    }
}



extension LinkedList: CustomStringConvertible {
    public var description: String  {
        var text = "["
        var node = head
        // 4
        while node != nil {
          text += "\(node!.value)"
          node = node!.next
          if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}

let dogBread = LinkedList()
dogBread.append(value: "labrador")
dogBread.append(value: "bulldog")
dogBread.append(value: "husky")
dogBread.append(value: "Beagle")
makeListToOddEven(dogBread)


print(dogBread)




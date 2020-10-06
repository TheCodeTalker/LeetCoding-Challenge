/*
 
 You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

 Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

  

 Example 1:


 Input: root = [4,2,7,1,3], val = 5
 Output: [4,2,7,1,3,5]
 Explanation: Another accepted tree is:

 Example 2:

 Input: root = [40,20,60,10,30,50,70], val = 25
 Output: [40,20,60,10,30,50,70,null,null,25]
 Example 3:

 Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
 Output: [4,2,7,1,3,5]
 
 */


public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
         if root?.val ?? 0 > val {
            root?.left = self.insertIntoBST(root?.left, val)
            
        }else {
            root?.right = self.insertIntoBST(root?.right, val)
        }
        return root
    }
    
    func searchIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root?.val == val {
            return root
        }else if root?.val ?? 0 > val && root?.left != nil{
            return searchIntoBST(root?.left, val)
        }else if root?.val ?? 0 < val && root?.right != nil {
            return searchIntoBST(root?.right, val)
        }
        return nil // Not Found
    }
    
    func returnTree() -> TreeNode{
        let leftNode2 = TreeNode(4)
        let rightNode2 = TreeNode(7)
        let leftNode1 = TreeNode(1)
        let rightNode1 = TreeNode(6,leftNode2,rightNode2)
        let leftNode = TreeNode(3,leftNode1,rightNode1)
        let rightNode3 = TreeNode(13)
        let leftNode3 = TreeNode(14,rightNode3,nil)
        let rightNNode = TreeNode(10,nil,leftNode3)
        let root = TreeNode(8, leftNode, rightNNode)
        return root
    }

}

let sol = Solution()
let root = sol.returnTree()
let searchRoot = sol.searchIntoBST(root, 13)
print(searchRoot?.val)

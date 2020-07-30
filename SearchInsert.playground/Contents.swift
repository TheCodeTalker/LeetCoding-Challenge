import UIKit


/*
Problem: 2
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

 Example 1:

 Input: [1,3,5,6], 5
 Output: 2
 
 Example 2:

 Input: [1,3,5,6], 2
 Output: 1
 */
 class Solution {
     func searchInsert(_ nums: [Int], _ target: Int) -> Int {
         for i in 0 ..< nums.count where nums[i] >= target {
             return i
         }
         
         return nums.isEmpty == true ? 0 : nums.count
     }
 }

 var array = [1,3,5,6]
 let sol = Solution()

 print(sol.searchInsert(array, 7))
 

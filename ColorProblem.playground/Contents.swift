import UIKit


//Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
//
//Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
//
//Note: You are not suppose to use the library's sort function for this problem.
//
//Example:
//
//Input: [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
//Follow up:
//
//A rather straight forward solution is a two-pass algorithm using counting sort.
//First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
//Could you come up with a one-pass algorithm using only constant space?

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0, mid = 0
        var hi = nums.count - 1
        while (mid <= hi) {
            switch nums[mid] {
            case 0:
                swap(&nums, from: low, to: mid)
                low += 1
                mid += 1
            case 1:
                mid += 1
            case 2:
            swap(&nums, from: mid, to: hi)
                hi -= 1
            default:
                break
                
            }
        }
    }
    
    func swap(_ array: inout [Int], from: Int, to: Int) {
        let temp = array[from]
        array[from] = array[to]
        array[to] = temp
    }
}

var array = [2,0,2,1,1,0]
let sol = Solution()
sol.sortColors(&array)

print(array)


/*
Sol2
 Approach: Count the number of 0s, 1s and 2s in the given array. Then store all the 0s in the beginning followed by all the 1s then all the 2s.
 Algorithm:
 Keep three counter c0 to count 0s, c1 to count 1s and c2 to count 2s
 Traverse through the array and increase the count of c0 is the element is 0,increase the count of c1 is the element is 1 and increase the count of c2 is the element is 2
 Now again traverse the array and replace first c0 elements with 0, next c1 elements with 1 and next c2 elements with 2.
 
 Complexity Analysis:
 Time Complexity: O(n).
 Only two traversals of the array is needed.
 Space Complexity: O(1).
 As no extra space is required.
*/

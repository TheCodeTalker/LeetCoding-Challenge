import UIKit
/*
 arr[] = {2,4,7,9,2,4}
 1. get the xor of all the elemnts
 xor = 2^4^7^9^2^4
 2.find the set_bit
 3.now divide the elements into two sets
 
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        guard var xor = nums.first else {
            return nums
        }
        var set_bit = 0
        var x = 0
        var y = 0
        for i in 1 ..< nums.count {
            xor = xor ^ nums[i]
        }
        print("\(xor)")
        
        set_bit = xor & ~(xor - 1)
        
        for i in 0 ..< nums.count {
            if ((nums[i] & set_bit) == 0) {
                x = x ^ nums[i]
            }else {
                y = y ^ nums[i]
            }
        }
        return [x,y]
    }
}

let nums = [1,2,1,3,2,5]
let sol = Solution()
sol.singleNumber(nums)

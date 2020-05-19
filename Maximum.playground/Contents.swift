import UIKit
import Foundation


extension Array {
    func repeated(count: Int) -> Array<Element> {
        assert(count > 0, "count must be greater than 0")

        var result = self
        for _ in 0 ..< count - 1 {
            result += self
        }

        return result
    }

}

func findCiculaArrayMaxSum(_ array: [Int]) -> Int?{
    if array.count <= 0 {
        return nil
    }
    let array_ = array.repeated(count: 2)
    var MAX_CURRENT: Int = 0
    
    var startIndex = 0
    var endIndex = array.count - 1
    for _ in 0 ..< ((array.count - 1) + 1){
        
    let localMax = getMaxSubArray(startIndex,endIndex: endIndex,array: array_,max_so_far: 0)
        startIndex += 1
        endIndex += 1
        if MAX_CURRENT < localMax {
            MAX_CURRENT = localMax
        }
    }
    return MAX_CURRENT
}

func getMaxSubArray(_ startIndex: Int, endIndex: Int, array: [Int], max_so_far: Int) -> Int {
    var max_ending_here = 0
    var max_so_far_ = max_so_far
    for index in startIndex ... endIndex {
        max_ending_here = max_ending_here + array[index]
        if max_so_far_ < max_ending_here {
            max_so_far_ = max_ending_here
        }
        if max_ending_here < 0 || max_ending_here < max_so_far_ {
            max_ending_here = 0
        }
    }
    return max_so_far_
}
//[1,-2,3,-2] -> 3
//[5,-3,5] -> 10
// [3,-1,2,-1] -> 4
// [3,-2,2,-3] -> 3
//[-2,-3,-1] -> -1
let array = [-2,-3,-1]

if let subArrayCount = findCiculaArrayMaxSum(array) {
    print("Maximum Sum Circular Subarray is \(subArrayCount)")
}else {
    print("Array is empty")
}

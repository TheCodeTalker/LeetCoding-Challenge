/*
 
 Given a list of intervals, remove all intervals that are covered by another interval in the list.

 Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.

 After doing so, return the number of remaining intervals.

  

 Example 1:

 Input: intervals = [[1,4],[3,6],[2,8]]
 Output: 2
 Explanation: Interval [3,6] is covered by [2,8], therefore it is removed.
 Example 2:

 Input: intervals = [[1,4],[2,3]]
 Output: 1
 Example 3:

 Input: intervals = [[0,10],[5,12]]
 Output: 2
 Example 4:

 Input: intervals = [[3,10],[4,10],[5,11]]
 Output: 2
 Example 5:

 Input: intervals = [[1,2],[1,4],[3,4]]
 Output: 1
 
 */

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var result = 0
        var ending = 0
        let sort = intervals.sorted { (elem1, elem2) -> Bool in
            if elem1[0] == elem2[0] && elem1[1] > elem2[1]  { return true }
            return elem1[0] < elem2[0]
        }
        for element in sort  {
            if element[1] > ending {
                ending = element[1]
                result += 1
            }
        }
        return result
    }
}

var value = [[1,2],[1,4],[3,4]]
let sol =  Solution()
sol.removeCoveredIntervals(value)

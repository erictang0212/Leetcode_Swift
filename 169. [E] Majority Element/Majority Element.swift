//
//  Majority Element.swift
//
//
//  Created by Eric Tang on 2023/12/19.
//
/**
Given an array nums of size n, return the majority element.
The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
 

Example 1:
Input: nums = [3,2,3]
Output: 3

Example 2:
Input: nums = [2,2,1,1,1,2,2]
Output: 2
 
Constraints:
n == nums.length
1 <= n <= 5 * 104
-109 <= nums[i] <= 109
 
Follow-up: Could you solve the problem in linear time and in O(1) space?
*/

import Foundation

/// O(n)
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        nums.map({ dict[$0] = (dict[$0] ?? 0) + 1 })
        return dict.max(by: { $0.value < $1.value })?.key ?? 0
    }
}

let solution = Solution()
var nums = [3,2,3]
solution.majorityElement(nums)
nums = [2,2,1,1,1,2,2]
solution.majorityElement(nums)


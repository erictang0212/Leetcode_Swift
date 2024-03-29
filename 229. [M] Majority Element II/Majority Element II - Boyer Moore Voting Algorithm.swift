
//
//  Majority Element II.swift
//
//
//  Created by Eric Tang on 2023/12/23.
//
/**
Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 

Example 1:
Input: nums = [3,2,3]
Output: [3]

Example 2:
Input: nums = [1]
Output: [1]

Example 3:
Input: nums = [1,2]
Output: [1,2]
 
Constraints:
1 <= nums.length <= 5 * 104
-109 <= nums[i] <= 109
 
Follow up: Could you solve the problem in linear time and in O(1) space?
*/

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var target1: Int?
        var target2: Int?
        var count1 = 0
        var count2 = 0
        
        for num in nums {
            if num == target1 {
                count1 += 1
            } else if num == target2 {
                count2 += 1
            } else if count1 == 0 {
                target1 = num
                count1 = 1
            } else if count2 == 0 {
                target2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        count1 = 0
        count2 = 0
        
        for num in nums {
            if num == target1 {
                count1 += 1
            } else if num == target2 {
                count2 += 1
            }
        }
        
        var result = [Int]()
        if count1 > nums.count / 3, target1 != nil {
            result.append(target1!)
        }
        if count2 > nums.count / 3, target2 != nil {
            result.append(target2!)
        }
        return result
    }
}

let solution = Solution()
solution.majorityElement([3,2,3,3,2,2,1,1])
solution.majorityElement([1])
solution.majorityElement([1,2])




//
//  Island Perimeter.swift
//
//
//  Created by Eric Tang on 2023/12/14.
//
/**
You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.
Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 

Example 1:
￼
Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
Explanation: The perimeter is the 16 yellow stripes in the image above.

Example 2:
Input: grid = [[1]]
Output: 4

Example 3:
Input: grid = [[1,0]]
Output: 4
 
Constraints:
row == grid.length
col == grid[i].length
1 <= row, col <= 100
grid[i][j] is 0 or 1.
There is exactly one island in grid.
*/

import Foundation

struct Index {
    var i: Int
    var j: Int
}

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var indexs: [Index] = []
        var result = Int()
        
        for (i, islands) in grid.enumerated() {
            for (j, island) in islands.enumerated() where island == 1 {
                indexs.append(Index(i: i, j: j))
            }
        }
        
        for i in indexs {
            var perimeter = 4
            if indexs.contains(where: { $0.i == i.i-1 && $0.j == i.j }) {
                perimeter -= 1
            }
            if indexs.contains(where: { $0.i == i.i+1 && $0.j == i.j }) {
                perimeter -= 1
            }
            if indexs.contains(where: { $0.i == i.i && $0.j == i.j-1 }) {
                perimeter -= 1
            }
            if indexs.contains(where: { $0.i == i.i && $0.j == i.j+1 }) {
                perimeter -= 1
            }
            result += perimeter
        }
        
        return result
    }
}

let solution = Solution()
var grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
solution.islandPerimeter(grid)

grid = [[1]]
solution.islandPerimeter(grid)

grid = [[1,0]]
solution.islandPerimeter(grid)

grid = [[1,1]]
solution.islandPerimeter(grid)

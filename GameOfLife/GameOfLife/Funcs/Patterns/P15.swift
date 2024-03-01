//
//  P15.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

func p15() -> [[Int]]{
    let pattern = [[0,0,1,0,0,0,0,1,0,0],
                   [1,1,0,1,1,1,1,0,1,1],
                   [0,0,1,0,0,0,0,1,0,0]]
    
    var p15 = createMatrix(cols: 22, rows: 22)
    
    for i in 4...6 {
        for j in 6...15 {
            p15[i][j] = pattern[i-4][j-6]
            p15[i+11][j] = pattern[i-4][j-6]
        }
    }
    
    return p15
}

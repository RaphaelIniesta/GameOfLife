//
//  Tumbler.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

// Tava indo tão bem...

func tumbler() -> [[Int]] {
    let pattern = [[1,1,0,0,0,1,1],
                   [1,0,1,0,1,0,1],
                   [1,0,1,0,1,0,1],
                   [0,0,1,0,1,0,0],
                   [0,1,1,0,1,1,0],
                   [0,1,1,0,1,1,0],
                   [0,0,0,0,0,0,0],
                   [0,1,1,0,1,1,0],
                   [0,1,1,0,1,1,0],
                   [0,0,1,0,1,0,0],
                   [1,0,1,0,1,0,1],
                   [1,0,1,0,1,0,1],
                   [1,1,0,0,0,1,1]]
    
    var tumbler = createMatrix(cols: 21, rows: 21)
    
    for i in 4...16 {
        for j in 7...13 {
            tumbler[i][j] = pattern[i-4][j-7]
        }
    }
    
    return tumbler
}

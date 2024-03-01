//
//  Cloverleaf.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 01/03/24.
//

import Foundation

func cloverleaf() -> [[Int]] {
    let pattern = [[0,0,0,1,0,1,0,0,0],
                   [0,1,1,1,0,1,1,1,0],
                   [1,0,0,0,1,0,0,0,1],
                   [1,0,1,0,0,0,1,0,1],
                   [0,1,1,0,1,0,1,1,0],
                   [0,0,0,0,0,0,0,0,0],
                   [0,1,1,0,1,0,1,1,0],
                   [1,0,1,0,0,0,1,0,1],
                   [1,0,0,0,1,0,0,0,1],
                   [0,1,1,1,0,1,1,1,0],
                   [0,0,0,1,0,1,0,0,0]]
    
    var cloverleaf = createMatrix(cols: 21, rows: 21)
    
    for i in 5...15 {
        for j in 6...14 {
            cloverleaf[i][j] = pattern[i-5][j-6]
        }
    }
    
    return cloverleaf
}

//
//  Hexag.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 01/03/24.
//

import Foundation

func hexag() -> [[Int]] {
    let pattern = [[0,0,1,0,0],
                   [0,1,0,1,0],
                   [1,0,0,0,1],
                   [1,0,0,0,1],
                   [1,0,0,0,1],
                   [0,1,0,1,0],
                   [0,0,1,0,0]]
    
    var hexag = createMatrix(cols: 21, rows: 21)
    
    for i in 8...14 {
        for j in 8...12 {
            hexag[i][j] = pattern[i-8][j-8]
        }
    }
    
    return hexag
}

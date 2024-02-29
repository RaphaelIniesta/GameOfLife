//
//  Octogon.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

func octogon() -> [[Int]] {
    let pattern = [[0,0,0,1,1,0,0,0],
                   [0,0,1,0,0,1,0,0],
                   [0,1,0,0,0,0,1,0],
                   [1,0,0,0,0,0,0,1],
                   [1,0,0,0,0,0,0,1],
                   [0,1,0,0,0,0,1,0],
                   [0,0,1,0,0,1,0,0],
                   [0,0,0,1,1,0,0,0]]
    
    var oct = createMatrix(cols: 22, rows: 22)
    
    for i in 7...14 {
        for j in 7...14 {
            oct[i][j] = pattern[i-7][j-7]
        }
    }
    
    return oct
}

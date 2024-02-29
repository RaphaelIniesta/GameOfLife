//
//  p8.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

func p8() -> [[Int]] {
    var p8 = createMatrix(cols: 22, rows: 22)
    
    for i in 0...2 {
        for j in 0...2 {
            p8[i+9][j+8] = 1
            p8[i+12][j+11] = 1
        }
    }
    
    return p8
}

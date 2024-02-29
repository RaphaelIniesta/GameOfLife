//
//  Pulsar.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

// Juro que não é de propósito ;-;

func pulsar() -> [[Int]] {
    let pattern = [[0,1,1,1,0],
                   [1,0,0,0,1],
                   [1,0,0,0,1],
                   [1,0,0,0,1],
                   [0,1,1,1,0]]
    var pul = createMatrix(cols: 21, rows: 21)
    
    for i in 5...9 {
        for j in 5...9 {
            pul[i][j] = pattern[i-5][j-5]
        }
    }
    
    for i in 5...9 {
        for j in 11...15 {
            pul[i][j] = pattern[i-5][j-11]
        }
    }
    
    for i in 11...15 {
        for j in 5...9 {
            pul[i][j] = pattern[i-11][j-5]
        }
    }
    
    for i in 11...15 {
        for j in 11...15 {
            pul[i][j] = pattern[i-11][j-11]
        }
    }
    
    return pul
}

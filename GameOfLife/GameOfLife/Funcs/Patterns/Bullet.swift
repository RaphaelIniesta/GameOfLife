//
//  Bullet.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 01/03/24.
//

import Foundation

func bullet() -> [[Int]] {
    let pattern = [[0,1,0],
                   [1,0,1],
                   [1,0,1],
                   [1,0,1],
                   [1,1,1]]
    
    var bullet = createMatrix(cols: 21, rows: 21)
    
    for i in 7...11 {
        for j in 9...11 {
            bullet[i][j] = pattern[i-7][j-9]
        }
    }
    
    return bullet
}

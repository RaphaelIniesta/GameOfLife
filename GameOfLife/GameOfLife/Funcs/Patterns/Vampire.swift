//
//  Vampire.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import Foundation

// Com certeza é possível fazer melhor, mas é o jeito que eu consegui com o tempo que tinha

func vampire() -> [[Int]] {
    var vamp = createMatrix(cols: 21, rows: 21)
    
    // Cabeça
    vamp[12][2] = 1
    vamp[12][3] = 1
    vamp[12][4] = 1
    vamp[13][2] = 1
    vamp[13][4] = 1
    vamp[14][2] = 1
    vamp[14][4] = 1
    
    // Corpo
    for i in 15...18 {
        vamp[i][3] = 1
    }
    
    // Braço dereito
    vamp[16][0] = 1
    vamp[16][2] = 1
    vamp[17][1] = 1
    
    // Braço esquerdo
    vamp[16][4] = 1
    vamp[17][5] = 1
    vamp[18][6] = 1
    
    // Pernas
    vamp[19][2] = 1
    vamp[19][4] = 1
    vamp[20][2] = 1
    vamp[20][4] = 1
    
    return vamp
}

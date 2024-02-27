//
//  CreateMatrix.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 27/02/24.
//

import Foundation

func criaMatriz(cols: Int, rows: Int) -> [[Int]] {
    var matriz: [[Int]] = []
    var linha: [Int] = []
    
    for _ in (0...cols-1) {
        for _ in 0...rows-1 {
            linha.append(Int.random(in: 0...1))
        }
        matriz.append(linha)
        linha.removeAll()
    }
    
    return matriz
}

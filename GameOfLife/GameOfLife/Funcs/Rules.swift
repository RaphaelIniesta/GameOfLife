//
//  Rules.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 27/02/24.
//

import Foundation

// Leis Game of Life
// 1. Qualquer célula viva com menos de dois vizinhos vivos morre, por subpopulação
// 2. Qualquer célula viva com dois ou três vizinhos vivos vive para a próxima geração
// 3. Qualquer célula viva com mais de três vizinhos vivos morre, por superpopulação
// 4. Qualquer célula morta com exatamente três vizinhos vivos se torna uma célula viva, por reprodução

func nextStep(matriz: [[Int]]) -> [[Int]] {
    var next = matriz
    
    var counter = 0
    
    for i in (0..<matriz.count) {
        for j in (0..<matriz[i].count) {
            
            // Casos dos cantos
            switch(i,j) {
            case (0,0): do {
                // MARK: Caso canto 1
                counter = matriz[0][1] + matriz[1][1] + matriz[1][0]
                
                if (matriz[i][j] == 0) {
                    if (counter == 3) {
                        next[i][j] = 1
                    }
                } else if (counter < 2) {
                    next[i][j] = 0
                }
                counter = 0
                
                break
            }
            case (0, matriz.count-1): do {
                // MARK: Caso canto 2
                counter = matriz[0][j-1] + matriz[i+1][j-1] + matriz[i+1][j]
                
                if (matriz[i][j] == 0) {
                    if (counter == 3) {
                        next[i][j] = 1
                    }
                } else if (counter < 2) {
                    next[i][j] = 0
                }
                counter = 0
                
                break
            }
            case (matriz.count-1, 0): do {
                // MARK: Caso canto 3
                counter = matriz[i-1][0] + matriz[i-1][j+1] + matriz[i][j+1]
                
                if (matriz[i][j] == 0) {
                    if (counter == 3) {
                        next[i][j] = 1
                    }
                } else if (counter < 2) {
                    next[i][j] = 0
                }
                counter = 0
                
                break
            }
            case (matriz.count-1, matriz.count-1): do {
                // MARK: Caso canto 4
                counter = matriz[i-1][j] + matriz[i-1][j-1] + matriz[i][j-1]
                
                if (matriz[i][j] == 0) {
                    if (counter == 3) {
                        next[i][j] = 1
                    }
                } else if (counter < 2) {
                    next[i][j] = 0
                }
                counter = 0
                
                break
            }
            default: break
                // TODO: Caso base
            }
            
            // Casos das bordas superior e inferior
            if ((j >= 1) && (j < matriz[i].count-1)) {
                switch(i) {
                case 0: do {
                    // MARK: Caso borda superior
                    counter = matriz[0][j-1] + matriz[1][j-1] + matriz[1][j] + matriz[1][j+1] + matriz[0][j+1]
//                    print(counter)
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        }
                    } else if ((counter < 2) || (counter > 3)) {
                        next[i][j] = 0
                    }
                    counter = 0
                    
                    break
                }
                case matriz.count-1: do {
                    // MARK: Caso borda inferior
                    counter = matriz[i][j-1] + matriz[i-1][j-1] + matriz[i-1][j] + matriz[i-1][j+1] + matriz[i][j+1]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        }
                    } else if ((counter < 2) || (counter > 3)) {
                        next[i][j] = 0
                    }
                    
                    counter = 0
                    
                    break
                }
                default: break
                }
            }
            
            // Casos das bordas esquerda e direita
            if ((i > 0) && (i < matriz.count-1)) {
                switch(j) {
                case 0: do {
                    // MARK: Caso borda esquerda
                    counter = matriz[i-1][0] + matriz[i-1][1] + matriz[i][1] + matriz[i+1][1] + matriz[i+1][0]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        }
                    } else if ((counter < 2) || (counter > 3)) {
                        next[i][j] = 0
                    }
                    
                    counter = 0
                    
                    break
                }
                case matriz.count-1: do {
                    // MARK: Caso borda direita
                    counter = matriz[i-1][j] + matriz[i-1][j-1] + matriz[i][j-1] + matriz[i+1][j-1] + matriz[i+1][j]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        }
                    } else if ((counter < 2) || (counter > 3)) {
                        next[i][j] = 0
                    }
                    
                    counter = 0
                    
                    break
                }
                default: break
                }
            }
            
            // MARK: Casos gerais
            if (((i > 0) && (i < matriz.count-1)) && ((j > 0) && (j < matriz[i].count-1))) {
                counter = matriz[i-1][j-1] + matriz[i-1][j] + matriz[i-1][j+1] + matriz[i][j+1] + matriz[i+1][j+1] + matriz[i+1][j] + matriz[i+1][j-1] + matriz[i][j-1]
                
                if (matriz[i][j] == 0) {
                    if (counter == 3) {
                        next[i][j] = 1
                    }
                } else if ((counter < 2) || counter > 3) {
                    next[i][j] = 0
                }
            }
        }
    }
    
    return next
}

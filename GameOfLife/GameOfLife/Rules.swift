//
//  Rules.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 27/02/24.
//

import Foundation

func nextStep(matriz: [[Int]]) -> [[Int]] {
    var next = matriz
    
    var counter = 0
    
    for i in (0..<matriz.count) {
        for j in (0..<matriz[i].count) {
            
            // Casos dos cantos
            switch(i,j) {
            case (0,0): do {
                // TODO: Caso canto 1
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
                // TODO: Caso canto 2
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
                // TODO: Caso canto 3
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
                // TODO: Caso canto 4
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
            if ((j > 0) && (j < matriz[i].count-1)) {
                switch(i) {
                case 0: do {
                    // TODO: Caso borda superior
                    counter = matriz[i][j-1] + matriz[i+1][j-1] + matriz[i+1][j] + matriz[i+1][j+1] + matriz[i][j+1]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        } else if ((counter < 2) || (counter > 3)) {
                            next[i][j] = 0
                        }
                    }
                    counter = 0
                    
                    break
                }
                case matriz.count-1: do {
                    // TODO: Caso borda inferior
                    counter = matriz[i][j-1] + matriz[i-1][j-1] + matriz[i-1][j] + matriz[i-1][j+1] + matriz[i][j+1]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        } else if ((counter < 2) || (counter > 3)) {
                            next[i][j] = 0
                        }
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
                    // TODO: Caso borda esquerda
                    counter = matriz[i-1][0] + matriz[i-1][1] + matriz[i][1] + matriz[i+1][1] + matriz[i+1][0]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        } else if ((counter < 2) || (counter > 3)) {
                            next[i][j] = 0
                        }
                    }
                    counter = 0
                    
                    break
                }
                case matriz.count-1: do {
                    // TODO: Caso borda direita
                    counter = matriz[i-1][j] + matriz[i-1][j-1] + matriz[i][j-1] + matriz[i+1][j-1] + matriz[i+1][j]
                    
                    if (matriz[i][j] == 0) {
                        if (counter == 3) {
                            next[i][j] = 1
                        } else if ((counter < 2) || (counter > 3)) {
                            next[i][j] = 0
                        }
                    }
                    counter = 0
                    
                    break
                }
                default: break
                }
            }
            
            // Casos gerais
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

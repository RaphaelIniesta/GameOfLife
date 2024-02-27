//
//  ContentView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    
    func criaMatriz(cols: Int, rows: Int) -> [[Bool]] {
        var matriz: [[Bool]] = []
        var linha: [Bool] = []
        
        for _ in (0...rows-1) {
            for _ in 0...cols-1 {
                let valor = Int.random(in: 0...1)
                
                if(valor == 1) {
                    linha.append(true)
                } else {
                    linha.append(false)
                }
            }
            matriz.append(linha)
            linha.removeAll()
        }
        
        return matriz
    }
    
    @State var matriz: [[Bool]] = []
    
    var cols = 5
    var rows = 5
    
    var body: some View {
        VStack {
            
            Button("Matriz") {
                matriz = criaMatriz(cols: cols, rows: rows)
                for i in (0...matriz.count-1) {
                    for j in (0...matriz[i].count-1) {
                        print(matriz[i][j], terminator: "")
                    }
                    print("\n")
                }
            }
            
            ForEach(0..<matriz.count, id: \.self) { i in
                HStack {
                    ForEach(0..<matriz[i].count, id: \.self) { j in
                        if (matriz[i][j]) {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.cyan)
                        } else {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

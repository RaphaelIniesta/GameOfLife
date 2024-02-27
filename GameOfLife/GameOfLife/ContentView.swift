//
//  ContentView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 26/02/24.
//

import SwiftUI

struct ContentView: View {

    // Leis Game of Life
    // 1. Qualquer célula viva com menos de dois vizinhos vivos morre, por subpopulação
    // 2. Qualquer célula viva com dois ou três vizinhos vivos vive para a próxima geração
    // 3. Qualquer célula viva com mais de três vizinhos vivos morre, por superpopulação
    // 4. Qualquer célula morta com exatamente três vizinhos vivos se torna uma célula viva, por reprodução
    
    @State var matriz: [[Int]] = []
    @State private var isFull: Bool = true
    
    var cols = 5
    var rows = 5
    
    var body: some View {
        VStack {
            
            ForEach(0..<matriz.count, id: \.self) { i in
                HStack {
                    ForEach(0..<matriz[i].count, id: \.self) { j in
                        if (matriz[i][j] == 1) {
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
            
            Button {
                matriz = criaMatriz(cols: cols, rows: rows)
                if(isFull) {
                    isFull.toggle()
                }
            } label: {
                Text("Gerar Grid Aleatória")
                    .foregroundStyle(.white)
            }
            .frame(width: 150, height: 50)
            .background(RoundedRectangle(cornerRadius: 15.0).fill(.blue))
            
            Button {
                matriz = nextStep(matriz: matriz)
            } label: {
                Text("Next Step")
                    .foregroundStyle(.white)
            }
            .frame(width: 150, height: 50)
            .background(RoundedRectangle(cornerRadius: 15.0).fill(.blue))
            .grayscale(isFull ? 1 : 0)
            .disabled(isFull)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

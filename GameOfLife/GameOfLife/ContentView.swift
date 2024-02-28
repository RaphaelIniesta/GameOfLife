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
    
    @State var colsString: String = ""
    @State var rowsString: String = ""
    
    @State var cols = 5
    @State var rows = 5
    
    @State var colsIsUsed: Bool = false
    @State var rowsIsUsed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(0..<matriz.count, id: \.self) { i in
                    HStack {
                        ForEach(0..<matriz[i].count, id: \.self) { j in
                            if (matriz[i][j] == 1) {
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.cyan)
                                    .onTapGesture(perform: {
                                        if (matriz[i][j] == 1) {
                                            matriz[i][j] = 0
                                        } else {
                                            matriz[i][j] = 1
                                        }
                                    })
                            } else {
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.gray)
                                    .onTapGesture(perform: {
                                        if (matriz[i][j] == 1) {
                                            matriz[i][j] = 0
                                        } else {
                                            matriz[i][j] = 1
                                        }
                                    })
                            }
                        }
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Linhas")
                        
                        TextField("Linhas", text: $rowsString)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Colunas")
                        
                        TextField("Colunas", text: $colsString)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        cols = Int(colsString) ?? 5
                        rows = Int(rowsString) ?? 5
                        
                        matriz = createRandomMatrix(cols: cols, rows: rows)
                        if(isFull) {
                            isFull.toggle()
                        }
                    } label: {
                        Image(systemName: "shuffle.circle")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if(isFull) {
                            isFull.toggle()
                        }
                        
                        cols = Int(colsString) ?? 7
                        rows = Int(rowsString) ?? 7
                        
                        matriz = createMatrix(cols: cols, rows: rows)
                    } label: {
                        Text("Generate Grid")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 150, height: 50)
                    .background(RoundedRectangle(cornerRadius: 15.0).fill(.blue))
                    .grayscale((colsIsUsed && rowsIsUsed) ? 0 : 1)
                    .disabled(!colsIsUsed)
                }
                
                ToolbarItem(placement: .bottomBar) {
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
            }
            .onChange(of: colsString) { _,_ in
                if(colsString != "") {
                    colsIsUsed = true
                }
            }
            .onChange(of: rowsString) { _,_ in
                if(rowsString != "") {
                    rowsIsUsed = true
                }
            }

        }
    }
}

#Preview {
    ContentView()
}

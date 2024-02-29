//
//  ContentView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var matriz: [[Int]] = []
    @State private var isFull: Bool = true
    
    @State var liveCell: Color = .cyan
    @State var deadCell: Color = .gray
    
    @State var colsString: String = ""
    @State var rowsString: String = ""
    
    @State var cols = 5
    @State var rows = 5
    
    @State var colsIsUsed: Bool = false
    @State var rowsIsUsed: Bool = false
    
    @State private var timer: Timer?
    @State var speed: Double = -1.0
    @State var iterations: TimeInterval = 0
    @State var isRunning: Bool = false
    
    @State var isShow: Bool = false
    
    func play(speed: Double) {
        let steps = speed * (-1)
        
        timer = Timer.scheduledTimer(withTimeInterval: steps, repeats: true) { _ in
            matriz = nextStep(matriz: matriz)
        }
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Spacer()
                ForEach(0..<matriz.count, id: \.self) { i in
                    HStack(spacing: 5) {
                        ForEach(0..<matriz[i].count, id: \.self) { j in
                            if (matriz[i][j] == 1) {
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(liveCell)
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
                                    .foregroundStyle(deadCell)
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
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Linhas")
                        
                        TextField("Linhas", text: $rowsString)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Colunas")
                        
                        TextField("Colunas", text: $colsString)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Button {
                    print("Teste")
                    if(!isRunning) {
                        play(speed: speed)
                        isRunning.toggle()
                    } else {
                        pause()
                        isRunning.toggle()
                    }
                    
                } label: {
                    Image(systemName: isRunning ? "pause" : "play.fill")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                }
                .frame(width: 70, height: 70)
                .background(Circle().foregroundStyle(.blue))
                
                Slider(value: $speed, in: -1...(-0.01))
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShow = true
                    } label: {
                        Image(systemName: isShow ? "gearshape.fill" : "gearshape")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        cols = Int(colsString) ?? 5
                        rows = Int(rowsString) ?? 5
                        
//                        matriz = createRandomMatrix(cols: cols, rows: rows)
                        matriz = tumbler()
                        if(isFull) {
                            isFull.toggle()
                        }
                    } label: {
                        Image(systemName: "shuffle.circle")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    ButtonsView(matriz: $matriz, isRunning: $isRunning, timer: $timer, isFull: $isFull, cols: $cols, rows: $rows, colsString: $colsString, rowsString: $rowsString, colsIsUsed: $colsIsUsed, rowsIsUsed: $rowsIsUsed)
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
            .onChange(of: speed) { _,_ in
                pause()
                if(isRunning) {
                    play(speed: speed)
                }
            }
            .onAppear {
                isFull = false
                matriz = createMatrix(cols: cols, rows: rows)
            }
            .sheet(isPresented: $isShow, content: {
                ConfigView(liveCell: $liveCell, deadCell: $deadCell)
            })
        }
    }
}

#Preview {
    ContentView()
}

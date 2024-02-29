//
//  ButtonsView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 28/02/24.
//

import SwiftUI

struct ButtonsView: View {
    
    @Binding var matriz: [[Int]]
    
    @Binding var isRunning: Bool
    @Binding var timer: Timer?
    
    @Binding var isFull: Bool
    
    @Binding var cols: Int
    @Binding var rows: Int
    
    @Binding var colsString: String
    @Binding var rowsString: String
    
    @Binding var colsIsUsed: Bool
    @Binding var rowsIsUsed: Bool
    
    func play(speed: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { _ in
            matriz = nextStep(matriz: matriz)
        }
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    var body: some View {
        VStack {
            
            HStack {
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
    }
}

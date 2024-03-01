//
//  MenuView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 01/03/24.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var cols: Int
    @Binding var rows: Int
    
    @Binding var colsString: String
    @Binding var rowsString: String
    
    @Binding var isFull: Bool
    
    @Binding var matriz: [[Int]]
    
    var body: some View {
        Menu {
            Button {
                cols = Int(colsString) ?? 5
                rows = Int(rowsString) ?? 5
                
                matriz = createRandomMatrix(cols: cols, rows: rows)
                if(isFull) {
                    isFull.toggle()
                }
            } label: {
                Text("Random")
            }
            
            Button {
                matriz = vampire()
            } label: {
                Text("Vampire")
            }
            
            Button {
                matriz = pulsar()
            } label: {
                Text("Pulsar")
            }
            
            Button {
                matriz = octogon()
            } label: {
                Text("Octogon")
            }
            
            Button {
                matriz = tumbler()
            } label: {
                Text("Tumbler")
            }
            
            Button {
                matriz = cloverleaf()
            } label: {
                Text("Cloverleaf")
            }
            
            Button {
                matriz = hexag()
            } label: {
                Text("Hexag")
            }
            
            Button {
                matriz = bullet()
            } label: {
                Text("Bullet")
            }
            
            Button {
                matriz = p8()
            } label: {
                Text("P15")
            }
            
            Button {
                matriz = p15()
            } label: {
                Text("P15")
            }
            
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}

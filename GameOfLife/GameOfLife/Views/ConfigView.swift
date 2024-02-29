//
//  ConfigView.swift
//  GameOfLife
//
//  Created by Raphael Iniesta Reis on 29/02/24.
//

import SwiftUI

struct ConfigView: View {
    
    @Binding var liveCell: Color
    @Binding var deadCell: Color
    
    var cores: [Color] = [.blue, .yellow, .green, .purple, .brown, .red, .cyan, .indigo, .mint, .orange, .black, .gray, .teal, .pink]
    
    var body: some View {
            VStack {
                Text("Live Cell Color")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(liveCell)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 5)
                            .frame(width: 65, height: 65)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 30)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cores, id: \.self) { live in
                            Button {
                                liveCell = live
                            } label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(live)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Dead Cell Color")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(deadCell)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 5)
                            .frame(width: 65, height: 65)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 30)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cores, id: \.self) { cor in
                            Button {
                                deadCell = cor
                            } label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(cor)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }


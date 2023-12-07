//
//  StatisticsView.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = BetsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 30, content: {
                        
                        HStack(content: {
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 12, weight: .regular))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                            
                            Spacer()
                            
                            Text("+0%")
                                .foregroundColor(.green)
                                .font(.system(size: 12, weight: .regular))
                                .frame(height: 30)
                                .padding(.horizontal, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 3, content: {
                            
                            Text("Profit")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("+ \(viewModel.bets.map(\.amount).reduce(0, +))$")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    
                    VStack(alignment: .leading, spacing: 30, content: {
                        
                        HStack(content: {
                            
                            Image(systemName: "arrow.down")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 12, weight: .regular))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                            
                            Spacer()
                            
                            Text("+0%")
                                .foregroundColor(.red)
                                .font(.system(size: 12, weight: .regular))
                                .frame(height: 30)
                                .padding(.horizontal, 10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 3, content: {
                            
                            Text("Spending")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("- \(viewModel.bets.map(\.coefficient).reduce(0, +))$")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                }
                .padding(.horizontal)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 3, content: {
                        
                        Text("Winings")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    
                    VStack(alignment: .leading, spacing: 3, content: {
                        
                        Text("Loses")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                }
                .padding(.horizontal)
                
                Circle()
                    .stroke(.gray.opacity(0.2), lineWidth: 15)
                    .frame(width: 150, height: 150)
                    .padding()
                    .overlay (
                    
                        VStack(alignment: .center, spacing: 5, content: {
                            
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .semibold))
                            
                            Text("Predictions")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        })
                    )
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                
                Spacer()
            }
        }
        .onAppear {
            
            viewModel.fetchBets()
        }
    }
}

#Preview {
    StatisticsView()
}

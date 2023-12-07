//
//  HistoryView.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = BetsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("History")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                if viewModel.bets.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium))
                        
                        Text("There are no active bets")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Click on the plus sign below to make one")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.bets, id: \.self) { index in
                            
                                VStack {
                                    
                                    Button(action: {
                                        
                                        if viewModel.selectedHistoryBet == index {
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.selectedHistoryBet = nil
                                            }
                                            
                                        } else {
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.selectedHistoryBet = index
                                            }
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text("WIN")
                                                .foregroundColor(Color("bg2"))
                                                .font(.system(size: 14, weight: .medium))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                                            
                                            Text("Placed: \((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))")
                                                .foregroundColor(.green)
                                                .font(.system(size: 15, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Image(systemName: viewModel.selectedHistoryBet == index ? "chevron.up" : "chevron.down")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2").opacity(0.5)))
                                    })
                                    
                                    if viewModel.selectedHistoryBet == index {
                                        
                                        VStack(alignment: .leading, spacing: 10, content: {
                                            
                                            HStack {
                                                
                                                Text("Competitions")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.game ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                            
                                            HStack {
                                                
                                                Text("Event")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.event ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                            
                                            HStack {
                                                
                                                Text("You bet on")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text("\(index.amount)$")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                            
                                            HStack {
                                                
                                                Text("Type")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.game_score ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                            
                                            HStack {
                                                
                                                Text("Profit")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text("100$")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                            
                                            HStack {
                                                
                                                Text("Date")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text("\((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            }
                                            .padding(.horizontal)
                                            .frame(height: 40)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).opacity(0.1))
                                        })
                                    }
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchBets()
        }
    }
}

#Preview {
    HistoryView()
}

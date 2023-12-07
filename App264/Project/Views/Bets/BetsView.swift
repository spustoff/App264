//
//  BetsView.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI

struct BetsView: View {
    
    @StateObject var viewModel = BetsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Bets")
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
                            
                                NavigationLink(destination: {
                                    
                                    BetsDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        
                                        HStack {
                                            
                                            Image(index.sport ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                            
                                            Text(index.game ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Text(index.game_score ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        Text("Today")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        HStack {
                                            
                                            HStack {
                                                
                                                Text("Amount")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Text("\(index.amount)$")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .medium))
                                            }
                                            .frame(height: 45)
                                            .frame(maxWidth: .infinity)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.1)))
                                            
                                            HStack {
                                                
                                                Text("Score")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Text("\(index.game_score ?? "")")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .medium))
                                            }
                                            .frame(height: 45)
                                            .frame(maxWidth: .infinity)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.1)))
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            
                                            HStack {
                                                
                                                Text("Odds")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Text("\(index.coefficient)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .medium))
                                            }
                                            .frame(height: 45)
                                            .frame(maxWidth: .infinity)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.1)))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                })
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            .onAppear {
                
                viewModel.fetchBets()
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        BetsAdd(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .bold))
                            .frame(width: 60, height: 60)
                            .background(Circle().fill(Color("prim")))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    BetsView()
}

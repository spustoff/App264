//
//  BetsAdd.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI

struct BetsAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: BetsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Bet Creation")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color("bg").opacity(0.2).ignoresSafeArea())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("What sport?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.sports, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.sport = index
                                            
                                        }, label: {
                                            
                                            VStack(alignment: .center, spacing: 10, content: {
                                                
                                                Image(index)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                
                                                Text(index)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .medium))
                                            })
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                            .overlay (
                                            
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color("prim"))
                                                    .opacity(viewModel.sport == index ? 1 : 0)
                                            )
                                        })
                                    }
                                }
                                .padding(1)
                            }
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("What event?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write the name of the event")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.event.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.event)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("What game?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write the team")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.game.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.game)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Make your prediction")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write your ideas")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.prediction.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.prediction)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("My bet")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Game score (ex. 1:0)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.game_score.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.game_score)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.amount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.amount)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Coefficient")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.coefficient.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.coefficient)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addBet(completion: {
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.fetchBets()
                        
                        viewModel.sport = ""
                        viewModel.event = ""
                        viewModel.game = ""
                        viewModel.prediction = ""
                        viewModel.game_score = ""
                        viewModel.amount = ""
                        viewModel.coefficient = ""
                    })
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.sport.isEmpty || viewModel.event.isEmpty || viewModel.game.isEmpty || viewModel.prediction.isEmpty || viewModel.game_score.isEmpty || viewModel.amount.isEmpty || viewModel.coefficient.isEmpty ? 0.5 : 1)
                .disabled(viewModel.sport.isEmpty || viewModel.event.isEmpty || viewModel.game.isEmpty || viewModel.prediction.isEmpty || viewModel.game_score.isEmpty || viewModel.amount.isEmpty || viewModel.coefficient.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    BetsAdd(viewModel: BetsViewModel())
}

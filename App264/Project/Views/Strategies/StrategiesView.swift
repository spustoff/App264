//
//  StrategiesView.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI

struct StrategiesView: View {
    
    @StateObject var viewModel = StrategiesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Strategies")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                if viewModel.strategies.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .medium))
                        
                        Text("There are no available strategies")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Click on the plus sign below to create one")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.strategies, id: \.self) { index in
                                
                                NavigationLink(destination: {
                                    
                                    StrategiesDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(String((index.name ?? "")).prefix(2))
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(height: 30)
                                            .padding(.horizontal, 10)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                })
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        StrategiesAdd(viewModel: viewModel)
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
        .onAppear {
            
            viewModel.fetchStrategies()
        }
    }
}

#Preview {
    StrategiesView()
}

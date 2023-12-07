//
//  BetsDetail.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI

struct BetsDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: BetsModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index.game ?? "")
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
                    
                    LazyVStack {
                        
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
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Prediction")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            Text(index.prediction ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Bet on the game")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(index.amount)$")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Coefficient")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Text("\(index.coefficient)%")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
            }
        }
    }
}

//#Preview {
//    BetsDetail()
//}

//
//  StrategiesAdd.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI

struct StrategiesAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: StrategiesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Strategy Creation")
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
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Write strategy name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.name)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Abbreviation")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.abb.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.abb)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Add description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.text.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.text)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .frame(height: 200, alignment: .top)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addStrategy {
                        
                        viewModel.fetchStrategies()
                        router.wrappedValue.dismiss()
                        
                        viewModel.name = ""
                        viewModel.abb = ""
                        viewModel.text = ""
                    }
                    
                }, label: {
                    
                    Text("Upload")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.abb.isEmpty || viewModel.text.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.abb.isEmpty || viewModel.text.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    StrategiesAdd(viewModel: StrategiesViewModel())
}

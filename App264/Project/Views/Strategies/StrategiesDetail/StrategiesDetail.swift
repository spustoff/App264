//
//  StrategiesDetail.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI

struct StrategiesDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: StrategiesModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Strategy")
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
                    
                    LazyVStack(alignment: .leading, spacing: 8) {
                        
                        Text(index.name ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.leading)
                        
                        Text(index.text ?? "")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.leading)
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

//#Preview {
//    StrategiesDetail()
//}

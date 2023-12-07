//
//  TabBar.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .frame(width: 23, height: 23)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("bgt"))
    }
}

enum Tab: String, CaseIterable {
    
    case Strategies = "Strategies"
    
    case History = "History"
    
    case Bets = "Bets"
    
    case Statistics = "Statistics"
    
    case Settings = "Settings"
}

#Preview {
    ContentView()
}

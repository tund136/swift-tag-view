//
//  Home.swift
//  TagView
//
//  Created by Danh Tu on 09/10/2021.
//

import SwiftUI

struct Home: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text("Filter\nMenu")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading )
            
            // Custom Tag View
            
            // TextField
            TextField("Apple", text: $text)
                .font(.title3)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.white.opacity(0.5), lineWidth: 1)
                )
            // Setting only TextFiled as Dark
                .environment(\.colorScheme, .dark)
            
            // Add Button
            Button(action: {
                
            }, label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemTeal))
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
            })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(.systemTeal)
                .ignoresSafeArea()
        )
    }
}


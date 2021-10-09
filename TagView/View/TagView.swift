//
//  TagView.swift
//  TagView
//
//  Created by Danh Tu on 09/10/2021.
//

import SwiftUI

// Custom view
struct TagView: View {
    var maxLimit: Int
    @Binding var tags: [Tag]
    
    var title: String = "Add some Tags"
    var fontSize: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.callout)
                .foregroundColor(.white)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    // Displaying Tags
                }
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.white.opacity(0.5), lineWidth: 1)
            )
        }
        .onChange(of: tags) { newValue in
            // Getting new inserted value
            guard let last = tags.last
            else {
                return
            }
            
            // Getting text size
            let font = UIFont.systemFont(ofSize: fontSize)
            
            let attributes = [NSAttributedString.Key.font: font]
            
            let size = (last.text as NSString).size(withAttributes: attributes)
            
            print(size)
        }
    }
}

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
                    ForEach(getRows(), id: \.self) { rows in
                        ForEach(rows) { row in
                            // Row View
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
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
            
            // Updating size
            tags[getIndex(tag: last)].size = size.width
        }
    }
    
    func getIndex(tag: Tag) -> Int {
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    // Basic logic
    // Splitting the array when it exceeds the screen size
    func getRows() -> [[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        // Calculating text width
        var totalWidth: CGFloat = 0
        
        // For safety extra 10
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach { tag in
            // Updating total width
            totalWidth += tag.size
            
            // Checking if total width is greater than size
            if totalWidth > screenWidth {
                // Adding row in rows
                // Clearning the data
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            } else {
                currentRow.append(tag)
            }
        }
        
        // Safe check
        // If having any value storing it in rows
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}

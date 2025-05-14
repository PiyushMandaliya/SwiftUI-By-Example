//
//  DrawCheckerBoard.swift
//  Drawing
//
//  Created by Piyush Mandaliya on 2025-05-13.
//

import SwiftUI


struct CheckerBoard: Shape {
    let rows: Int
    let columns: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct DrawCheckerBoard: View {
    var body: some View {
        CheckerBoard(rows: 8, columns: 8)
            .fill(.red)
            .frame(width: 200, height: 200)
            .background(.black)
    }
}

#Preview {
    DrawCheckerBoard()
}

//
//  DrawCustomPath.swift
//  Drawing
//
//  Created by Piyush Mandaliya on 2025-05-13.
//

import SwiftUI


struct ShringkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for i in stride(from: 1, to: 100, by: 7.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            path.addRect(insetRect)
        }

        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
}

struct DrawCustomPath: View {
    var body: some View {
        
        VStack {
            Spacer()
            ShringkingSquares()
                .stroke()
                .frame(width: 200, height: 200)
            
            Spacer()
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 200)
            Spacer()
        }
        

    }
}

#Preview {
    DrawCustomPath()
}

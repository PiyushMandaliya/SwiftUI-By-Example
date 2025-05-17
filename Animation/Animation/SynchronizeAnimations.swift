//
//  SynchronizeAnimations.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct SynchronizeAnimations: View {
    @State private var isFlipped = false
    @Namespace private var animation

    @Namespace private var zoomAnimation
    @State private var isZoomed = false

    var frame: Double {
        isZoomed ? 300 : 44
    }
    var body: some View {
        VStack {
//            if isFlipped {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 44, height: 44)
//                    .matchedGeometryEffect(id: "Shape", in: animation)
//
//                Text("Taylor Swift – 1989")
//                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                    .font(.headline)
//            } else {
//                Text("Taylor Swift – 1989")
//                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                    .font(.headline)
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 44, height: 44)
//                    .matchedGeometryEffect(id: "Shape", in: animation)
//
//            }
            
//            Spacer()
            
            VStack {
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: frame, height: frame)
                            .padding(.top, isZoomed ? 20 : 0)
                        
                        if isZoomed == false {
                            Text("Taylor Swift – 1989")
                                .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                                .font(.headline)
                            Spacer()
                        }
                    }
                    
                    if isZoomed == true {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                            .padding(.bottom, 60)
                        Spacer()
                    }
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        isZoomed.toggle()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color(white: 0.9))
                .foregroundStyle(.black)
            }
            
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    SynchronizeAnimations()
}

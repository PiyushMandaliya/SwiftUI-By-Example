//
//  MetalShaders.swift
//  Drawing
//
//  Created by Piyush Mandaliya on 2025-05-14.
//

import SwiftUI

struct MetalShaders: View {
    let startDate = Date()
    @State private var strength = 3.0
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "figure.run.circle.fill")
                .font(.system(size: 100))
                .colorEffect(ShaderLibrary.checkerboard(.float(10), .color(.blue)))
            
            Spacer()
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 100))
                    .colorEffect(ShaderLibrary.noise(.float(startDate.timeIntervalSinceNow)))
            }
            Spacer()
            
            Image(systemName: "figure.run.circle.fill")
                .font(.system(size: 100))
                .layerEffect(ShaderLibrary.pixellate(.float(10)), maxSampleOffset: .zero)
            
            Spacer()
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 100))
                    .distortionEffect(ShaderLibrary.simpleWave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: .zero)
            }
            Spacer()
            
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 100))
                    .visualEffect { content, proxy in
                        content
                            .distortionEffect(ShaderLibrary.complexWave(
                                .float(startDate.timeIntervalSinceNow),
                                .float2(proxy.size),
                                .float(0.5),
                                .float(8),
                                .float(10)
                            ), maxSampleOffset: .zero)
                    }
            }
            
            VStack {
                Image(systemName: "figure.run.circle.fill")
                    .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom))
                    .font(.system(size: 100))
                    .layerEffect(ShaderLibrary.emboss(.float(strength)), maxSampleOffset: .zero)
                
                Slider(value: $strength, in: 0...20)
            }
            .padding()
            
        }
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    MetalShaders()
}

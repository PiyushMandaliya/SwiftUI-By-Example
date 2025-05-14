//
//  CustomTextEffectsAndAnimation.swift
//  Drawing
//
//  Created by Piyush Mandaliya on 2025-05-14.
//

import SwiftUI

struct ZebraStripeRenderer: TextRenderer {
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        for (index, line) in layout.enumerated() {
            ctx.opacity = index.isMultiple(of: 2) ? 1 : 0.5
            ctx.draw(line)
        }
    }
}

struct BoxedRenderer: TextRenderer {
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for glyph in run {
                    context.stroke(Rectangle().path(in: glyph.typographicBounds.rect), with: .color(.blue), lineWidth: 2)
                }

                context.stroke(Rectangle().path(in: run.typographicBounds.rect), with: .color(.green), lineWidth: 2)
            }

            context.stroke(Rectangle().path(in: line.typographicBounds.rect), with: .color(.red), lineWidth: 2)

            context.draw(line)
        }
    }
}

struct WaveRenderer: TextRenderer {
    var strength: Double
    var frequency: Double

    var animatableData: Double {
        get { strength }
        set { strength = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for (index, glyph) in run.enumerated() {
                    let yOffset = strength * sin(Double(index) * frequency)
                    var copy = context

                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}

struct CustomTextEffectsAndAnimation: View {
    @State private var amount = -10.0

    var body: some View {
        ScrollView {
            Text("He thrusts his fists against the posts and still insists he sees the ghosts.")
                .font(.largeTitle)
                .textRenderer(ZebraStripeRenderer())
            VStack {
                (
                    Text("This is a **very** important string") +
                    Text(" with lots of text inside.")
                        .foregroundStyle(.secondary)
                )
                .font(.largeTitle)
                .textRenderer(BoxedRenderer())
            }
            
            Text("This is a very important string with lots of text inside.")
                .font(.largeTitle)
                .textRenderer(WaveRenderer(strength: amount, frequency: 0.5))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        amount = 10
                    }
                }
        }
    }
}

#Preview {
    CustomTextEffectsAndAnimation()
}

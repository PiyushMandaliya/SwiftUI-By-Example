//
//  ContentView.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct ContentView: View {
    
    private enum Content: CaseIterable {
        case basicAnimation, springAnimation, explicitAnimation, animationOnViewAppear, multipleAnimations, synchronizeAnimations, addRemoveViewWithTransition, combineTransitions, asymmentricTransition, customTransition, animationTextSize, overrideAnimationWithTransition, multiStepAnimation, multiStepAnimationUsingPhaseAnimator
        
        var title: String {
            switch self {
            case .basicAnimation:
                return "Basic Animation"
            case .springAnimation:
                return "Spring Animation"
            case .explicitAnimation:
                return "Explicit Animation"
            case .animationOnViewAppear:
                return "Animation on View Appear"
            case .multipleAnimations:
                return "Multiple Animations"
            case .synchronizeAnimations:
                return "Synchronize Animations"
            case .addRemoveViewWithTransition:
                return "Add/Remove View with Transition"
            case .combineTransitions:
                return "Combine Transitions"
            case .asymmentricTransition:
                return "Asymmentric Transition"
            case .customTransition:
                return "Custom Transition"
            case .animationTextSize:
                return "Animation Text Size"
            case .overrideAnimationWithTransition:
                return "Override Animation with Transition"
            case .multiStepAnimation:
                return "Multi Step Animation"
            case .multiStepAnimationUsingPhaseAnimator:
                return "Multi Step Animation Using Phase Animator"
            }
        }
        
        var destionation: AnyView {
            switch self {
            case .basicAnimation:
                return AnyView(BasicAnimation())
            case .springAnimation:
                return AnyView(SpringAnimation())
            case .explicitAnimation:
                return AnyView(ExplicitAnimation())
            case .multipleAnimations:
                return AnyView(MultipleAnimations())
            case .synchronizeAnimations:
                return AnyView(SynchronizeAnimations())
            case .addRemoveViewWithTransition:
                return AnyView(AddRemoveViewWithTransition())
            case .combineTransitions:
                return AnyView(CombineTransitions())
            case .asymmentricTransition:
                return AnyView(AsymmentricTransition())
            case .customTransition:
                return AnyView(CustomTransition())
            case .animationTextSize:
                return AnyView(AnimationTextSize())
            case .overrideAnimationWithTransition:
                return AnyView(OverrideAnimationWithTransition())
            case .multiStepAnimation:
                return AnyView(MultiStepAnimation())
            case .animationOnViewAppear:
                return AnyView(AnimationOnViewAppear())
            case .multiStepAnimationUsingPhaseAnimator:
                return AnyView(MultiStepAnimationUsingPhaseAnimator())
            }
        }
        
    }
    
    var body: some View {
        NavigationStack {
            List(Content.allCases, id: \.self) {content in
                NavigationLink(destination: content.destionation) {
                    Text(content.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

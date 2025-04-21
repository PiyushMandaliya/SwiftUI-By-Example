//
//  PriorityGesture.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

struct OtherGesture: View {
    let gestureType: GestureType
    
    // handle pinch to zoom for views
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    
    init(_ gestureType: GestureType) {
        self.gestureType = gestureType
    }
    
    var body: some View {
        switch gestureType {
        case .gestureRecognizer:
            getPriorityGesture()
        case .priorityGesture:
            getPriorityGesture()
        case .handlePinchZoom:
            handlePinchZoom()
        case .shakeGesture:
            shakeGesture()
        case .hoveringOverView:
            hoveringText()
        case .simultaneousGesture:
            simultaneousGesture()
        case .gestureChains:
            gestureChains()
        case .controlTapableArea:
            controlTapableArea()
        case .disableTaps:
            disableTap()
        }
        
    }
    
    private func getPriorityGesture() -> some View {
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
    
    
    //make two gestures recognize at the same time using simultaneousGesture()
    private func simultaneousGesture() -> some View {
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
    
    //create gesture chains using sequenced(before:)
    @State private var message = "Long press then drag"

    private func gestureChains() -> some View {
        let longPress = LongPressGesture()
            .onEnded { _ in
                message = "Now drag me"
            }
        
        let drag = DragGesture()
            .onEnded { _ in
                message = "Success!"
            }
        
        let combined = longPress.sequenced(before: drag)
        
        return Text(message)
            .gesture(combined)
        
    }
    
    
    //detect the user hovering over a view
    // macOS & iPadOS
    @State private var overText = false

    private func hoveringText() -> some View {
        Text("Hello, World!")
            .foregroundStyle(overText ? .green : .red)
            .onHover { over in
                overText = over
            }
    }
    
    
//    control the tappable area of a view using contentShape()
    private func controlTapableArea() -> some View {
        VStack {
            Image(systemName: "person.circle").resizable().frame(width: 50, height: 50)
            Spacer().frame(height: 50)
            Text("Paul Hudson")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Show details for user")
        }
        
    }
    
    // disable taps for a view using allowsHitTesting()
    private func disableTap() -> some View {
        ZStack {
            Text("Tap Me")
                .onTapGesture {
                    print("Button was tapped")
                }
                .frame(width: 100, height: 100)
                .background(.gray)
            
            Rectangle()
                .fill(.red.opacity(0.2))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .allowsHitTesting(false)
        }
    }

    private func shakeGesture() -> some View {
        Text("Shake me!")
            .onShake {
                print("Device shaken!")
            }
    }
    
    private func handlePinchZoom() -> some View {
        Image(.cat)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaleEffect(currentZoom + totalZoom)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentZoom = value.magnification - 1
                    }
                    .onEnded { value in
                        totalZoom += currentZoom
                        currentZoom = 0
                    }
            )
            .accessibilityZoomAction { action in
                if action.direction == .zoomIn {
                    totalZoom += 1
                } else {
                    totalZoom -= 1
                }
            }
    }
}

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

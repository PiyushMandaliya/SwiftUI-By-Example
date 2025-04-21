//
//  FourthScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

struct FourthScreen: View {
    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var name = ""

    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
        
        TextField("Enter your name: ", text: $name)
            .textFieldStyle(.roundedBorder)
            .onChange(of: name) { oldValue, newValue in
                print("Changing from \(oldValue) to \(newValue)")
            }
    }
}

#Preview {
    FourthScreen()
}

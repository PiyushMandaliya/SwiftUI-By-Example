//
//  FormView.swift
//  Forms
//
//  Created by Piyush Mandaliya on 2025-04-24.
//

import SwiftUI

struct FormView: View {
    let contentType: ContentType
    
    var body: some View {
        switch contentType {
        case .formDesign:
            formDesign()
        case .formSections:
            formSections()
        case .pickersInForms:
            pickersInForms()
        case .disableElements:
            enableDisableElements()
        case .showHideRows:
            showHideRows()
        case .labelAlignment:
            labelContent()
        }
    }
    
    
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]

    private func formDesign() -> some View {
        Form {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Toggle("Enable Logging", isOn: $enableLogging)
            
            Button("Save changes") {
                print("Activate theme!")
            }
        }
    }
    
    private func formSections() -> some View {
        Form {
            Section(footer: Text("Note: Enabling logging may slow down the app")) {
                Picker("Select a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Toggle("Enable Logging", isOn: $enableLogging)
            }
            
            Section {
                Button("Save changes") {
                    print("Activate theme!")
                }
            }
        }
    }
    
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]
    
    private func pickersInForms() -> some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
        }
    }
    
    @State private var agreedToTerms = false
    private func enableDisableElements() -> some View {
        Form {
            Section {
                Toggle("I agree to the terms", isOn: $agreedToTerms)
            }
            
            Section {
                Button("Continue") {
                    print("Thank you!")
                }
                .disabled(agreedToTerms == false)
            }
        }
    }
    
    @State private var showingAdvancedOptions = false
    private func showHideRows() -> some View {
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions)
                
                if showingAdvancedOptions {
                    Toggle("Enable logging", isOn: $enableLogging)
                }
            }
        }
    }
    
    @State private var brightness = 0.5
    @State private var shouldShowTextField = false
    @State private var textFieldText = ""
    private func labelContent() -> some View {
        Form {
            LabeledContent("This is important", value: "Value goes here")
            
            
            LabeledContent("This is important") {
                Image(systemName: "exclamationmark.triangle")
            }
            
            LabeledContent {
                Slider(value: $brightness)
            } label: {
                Text("Brightness")
            }
            
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
                Text("Subsubtitle")
                Text("Subsubsubtitle")
            }
            
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
                Text("Subsubtitle")
                Text("Subsubsubtitle")
            }
            .disabled(true)
            
            Section {
                
                LabeledContent {
                    Toggle("", isOn: $shouldShowTextField)
                } label: {
                    Text("Should show TF")
                }
                
                if (shouldShowTextField) {
                    LabeledContent {
                        TextField("Enter Value", text: $textFieldText)
                    } label: {
                        Text("Enter Text")
                    }
                }
                
            }
        }
    }
}

#Preview {
    FormView(contentType: .labelAlignment)
}

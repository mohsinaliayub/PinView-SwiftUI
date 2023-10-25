//
//  ContentView.swift
//  PinView
//
//  Created by Mohsin Ali Ayub on 19.10.23.
//

import SwiftUI

struct ContentView: View {
    var pinLength = 6
    
    // State properties
    @State private var pin = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Enter pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 10) {
                ForEach(0..<pinLength, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 55)
                        // Showing pin at each box with the help of index
                        .overlay {
                            
                        }
                }
            }
            .padding(.top, 16)
            .overlay(alignment: .bottomTrailing) {
                Button("Forgot pin?", action: {  })
                    .offset(y: 40)
            }
            .frame(maxHeight: .infinity)
            
            GeometryReader {_ in 
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                    ForEach(1...9, id: \.self) { number in
                        buttonWithText("\(number)")
                    }
                    
                    // 0 and back button
                    buttonWithText("")
                        .disabled(true)
                    
                    buttonWithText("0")
                    
                    Button(action: {
                        if !pin.isEmpty { pin.removeLast() }
                    }) {
                        Image(systemName: "delete.backward")
                            .modifier(NumberPadModifier())
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    private func buttonWithText(_ text: String) -> some View {
        Button(action: {
            if pin.count < pinLength {
                pin.append(text)
            }
        }) {
            Text(text)
                .modifier(NumberPadModifier())
        }
    }
    
    private struct NumberPadModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .contentShape(.rect)
        }
    }
}

#Preview {
    ContentView()
}

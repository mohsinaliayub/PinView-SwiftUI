//
//  NumberPadView.swift
//  PinView
//
//  Created by Mohsin Ali Ayub on 25.10.23.
//

import SwiftUI

struct NumberPadView: View {
    @Binding var pin: String
    var pinLength: Int
    
    var body: some View {
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
}

fileprivate struct NumberPadModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .contentShape(.rect)
    }
}

#Preview {
    NumberPadView(pin: .constant("4234"), pinLength: 4)
}

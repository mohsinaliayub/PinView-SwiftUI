//
//  PinLockView.swift
//  PinView
//
//  Created by Mohsin Ali Ayub on 25.10.23.
//

import SwiftUI

struct PinLockView<Content: View>: View {
    // Lock properties
    var lockPin: String
    var isEnabled: Bool
    var lockWhenAppGoesBackground: Bool = true
    @ViewBuilder var content: Content
    
    private let pinLength = 4
    
    // State properties
    @State private var pin = ""
    @State private var animateField = false
    @State private var isUnlocked = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            content
                .frame(width: size.width, height: size.height)
            
            if isEnabled && !isUnlocked {
                ZStack {
                    Rectangle().fill(.white).ignoresSafeArea()
                    
                    lockView
                }
            }
        }
        .onChange(of: pin) { oldValue, newValue in
            guard newValue.count == pinLength else { return }
            
            guard lockPin == pin else {
                print("wrong pin")
                pin = ""; animateField.toggle()
                return
            }
            
            withAnimation(.snappy, completionCriteria: .logicallyComplete) {
                print("Unlocked")
                isUnlocked = true
            } completion: {
                    // clear pin
                pin = ""
            }
        }
    }
    
    private var lockView: some View {
        VStack(spacing: 16) {
            Text("Enter pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
            
            pinBoxes
                .keyframeAnimator(initialValue: CGFloat.zero, trigger: animateField, content: { content, value in
                    content.offset(x: value)
                }, keyframes: { _ in
                    KeyframeTrack {
                        CubicKeyframe(30, duration: 0.07)
                        CubicKeyframe(-30, duration: 0.07)
                        CubicKeyframe(20, duration: 0.07)
                        CubicKeyframe(-20, duration: 0.07)
                        CubicKeyframe(0, duration: 0.07)
                    }
                })
            
            GeometryReader { _ in
                NumberPadView(pin: $pin, pinLength: pinLength)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    private var pinBoxes: some View {
        HStack(spacing: 10) {
            ForEach(0..<pinLength, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 55)
                    // Showing pin at each box with the help of index
                    .overlay {
                        if pin.count > index {
                            let index = pin.index(pin.startIndex, offsetBy: index)
                            let string = String(pin[index])
                            
                            Text(string)
                                .font(.title.bold())
                                .foregroundStyle(.white)
                        }
                    }
            }
        }
        .padding(.top, 16)
        .overlay(alignment: .bottomTrailing) {
            Button("Forgot pin?", action: {  })
                .offset(y: 40)
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}

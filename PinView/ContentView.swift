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
            
            
        }
        
    }
}

#Preview {
    ContentView()
}

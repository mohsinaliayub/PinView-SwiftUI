//
//  ContentView.swift
//  PinView
//
//  Created by Mohsin Ali Ayub on 19.10.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        PinLockView(lockPin: "4268", isEnabled: true) {
            VStack(spacing: 16) {
                Image(systemName: "globe")
                    .imageScale(.large)
                
                Text("Hello World!")
            }
        }
    }
}

#Preview {
    ContentView()
}

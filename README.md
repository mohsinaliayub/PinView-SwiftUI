# PinView-SwiftUI
A custom pin view with SwiftUI. 

## Description
The pin view is fairly easy to use. It requires a **lockPin** and an **isEnabled** property value. You need to provide your content, and the pin view will hide it from the user until they provide a valid pin.

You can see how the example app used it in the **ContentView**.

```swift
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
```

## Usage
You can use this pin view in your own apps easily. You need to copy both [NumberPadView.swift](PinView/Pin%20Components/NumberPadView.swift) and [PinLockView.swift](PinView/Pin%20Components/PinLockView.swift)
files in your own project.

These files contain all the functionality of pin validation and UI.



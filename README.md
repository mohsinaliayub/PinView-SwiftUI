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

## Implementation
I used a different approach to create pin view. Here is my approach to create pin view component:

- For the pin boxes, I didn't use **TextField**s. I used **RoundedRectangle** and overlayed each with one digit *text*.
- I had to create a custom number pad to let user provide a value. I used **LazyVGrid** with 3 columns to create an even number pad.
- I used **ScenePhase** environment value to check when the app goes to background, and let the user provide a custom pin again.


## Next steps
The component is complete, but there are still a few rough edges that I want to work on next. Here they are:
- [ ] Make sure the pin provided by user does not exceed the pin limit.
- [ ] Add a time limit (e.g., 5 minutes) after the app goes to background, and asks user to provide pin again.

## Screenshots
<img src="/Screenshots/app.gif" alt="App testing gif">

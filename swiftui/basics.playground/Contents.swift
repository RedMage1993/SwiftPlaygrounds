//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct BasicView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
        }
    }
}

PlaygroundPage.current.setLiveView(BasicView())

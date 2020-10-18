//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct BasicView: View {
    var body: some View {
        VStack {
            Text("Hello World (w/ padding at start)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
            Text("Hello World v2 (w/ padding at end)")
                .foregroundColor(.white)
                .background(Color.black)
                .padding()
                .background(Color.blue)
            Text("Hello World v3 (w/o padding)")
                .foregroundColor(.white)
                .background(Color.black)
        }
    }
}

PlaygroundPage.current.setLiveView(BasicView())

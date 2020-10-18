//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct BasicView: View {
    var body: some View {
        Text("Hello World")
    }
}

PlaygroundPage.current.setLiveView(BasicView())

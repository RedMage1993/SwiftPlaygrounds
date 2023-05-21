//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import Combine
import PlaygroundSupport

struct BasicView: View {
    @State var sliderValue: Float = 0
    
    var cancellables = Set<AnyCancellable>()
    
    let sliderSubject = PassthroughSubject<Float, Never>()
    
    init() {
        sliderSubject.sink {
            print($0)
        }.store(in: &cancellables)
    }
    
    var body: some View {
        Slider(value: $sliderValue.sending(to: sliderSubject))
    }
}

extension Binding {
    /// Sends new values to subject.
    /// - Parameter subject: A PassthroughSubject to send new values to.
    /// - Returns: Binding that hooks into an existing Binding.
    func sending(to subject: PassthroughSubject<Value, Never>) -> Binding<Value> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
            subject.send(newValue)
        }
    }
}

PlaygroundPage.current.setLiveView(BasicView())

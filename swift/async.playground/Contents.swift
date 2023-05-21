import Foundation
import Combine
import _Concurrency
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct A {
    func myPublisher() -> AnyPublisher<String, Never> {
        Just("Hello, World!")
            .eraseToAnyPublisher()
    }
}

let a = A()
var cancellables = Set<AnyCancellable>()

a.myPublisher().sink { value in
    print(value)
}.store(in: &cancellables)

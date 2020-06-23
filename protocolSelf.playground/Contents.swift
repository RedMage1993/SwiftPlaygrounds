import UIKit

protocol ProtocolWithDefaultReferencingSelf: class {
    static func referenceSelf()
}

extension ProtocolWithDefaultReferencingSelf {
    static func referenceSelf() {
        print(type(of: self))
        print(type(of: Self.self))
        print(Bundle(for: Self.self))
        print(String(describing: self))
    }
}

class SomeView: UIView {
    
}

extension SomeView: ProtocolWithDefaultReferencingSelf {}

SomeView.referenceSelf()

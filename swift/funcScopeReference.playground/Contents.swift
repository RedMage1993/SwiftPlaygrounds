import UIKit

class SomeClass {
    static let shared = SomeClass()
    
    func someFunc() {
        var aVarInFunc = 0
        
        ClassThatHoldsClosure.shared.funcThatSavesClosure {
            aVarInFunc += 1
            print("aVarInFunc: \(aVarInFunc)")
        }
    }
}

class ClassThatHoldsClosure {
    var closure: (() -> Void)?
    
    static let shared = ClassThatHoldsClosure()
    
    func funcThatSavesClosure(_ closure: (() -> Void)?) {
        self.closure = closure
    }
}

print("Retain count on SomeClass: \(CFGetRetainCount(SomeClass.shared))")

let aRef = SomeClass.shared

print("Retain count on SomeClass: \(CFGetRetainCount(SomeClass.shared))")

SomeClass.shared.someFunc()

print("Retain count on SomeClass: \(CFGetRetainCount(SomeClass.shared))")

ClassThatHoldsClosure.shared.closure?()
ClassThatHoldsClosure.shared.closure?()
ClassThatHoldsClosure.shared.closure?()

print("Retain count on SomeClass: \(CFGetRetainCount(SomeClass.shared))")

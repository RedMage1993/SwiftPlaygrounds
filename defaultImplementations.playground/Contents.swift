import UIKit

protocol SomeProtocol {
    func funcA() -> String
    func funcC() -> String
}

extension SomeProtocol {
    func funcA() -> String {
        return "Extension FuncA"
    }
    
    func funcB() -> String {
        return "Extension FuncB"
    }
    
    func funcC() -> String {
        return "Extension FuncC"
    }
}

struct SomeStruct: SomeProtocol {
    func funcB() -> String {
        return "Struct FuncB"
    }
    
    func funcC() -> String {
        return "Struct FuncC"
    }
}

let someStruct = SomeStruct()
let someProtocolStruct: SomeProtocol = SomeStruct()

someStruct.funcA()
someStruct.funcB()
someStruct.funcC()

someProtocolStruct.funcA()
someProtocolStruct.funcB()
someProtocolStruct.funcC()

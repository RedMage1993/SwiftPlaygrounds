import UIKit

// Test A
enum EnumTestA: String {
    case caseTest = "notTheCaseName"
}

let aStringOfCaseTest = String(describing: EnumTestA.caseTest) // this is "caseTest", not "notTheCaseName"
let aStringOfCaseTest2 = "\(EnumTestA.caseTest)" // "caseTest"

// Test B
enum EnumTestB: String {
    case caseTest = "notTheCaseName"
    
    var description: String {
        return rawValue
    }
}

let bStringOfCaseTest = String(describing: EnumTestB.caseTest) // this is "caseTest", not "notTheCaseName"
let bStringOfCaseTest2 = "\(EnumTestB.caseTest)" // "caseTest"

// Test C
enum EnumTestC: String, CustomStringConvertible {
    case caseTest = "notTheCaseName"
    
    var description: String {
        return rawValue
    }
}

let cStringOfCaseTest = String(describing: EnumTestC.caseTest) // now this is "notTheCaseName"
let cStringOfCaseTest2 = "\(EnumTestC.caseTest)" // "notTheCaseName"

// Test D
enum EnumTestD {
    case caseTest
}

let dSomeVarHoldingCaseTest = EnumTestD.caseTest

let dStringOfCaseTest = String(describing: EnumTestD.caseTest) // this is "caseTest"
let dStringOfCaseTest2 = "\(EnumTestD.caseTest)" // "caseTest"
let dStringOfCaseTest3 = "\(dSomeVarHoldingCaseTest)" // "caseTest"

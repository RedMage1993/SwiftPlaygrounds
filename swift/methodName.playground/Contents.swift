import UIKit

func randomFunc(_ param: String) {
    print(#function[..<#function.firstIndex(of: "(")!])
}

randomFunc("hi")



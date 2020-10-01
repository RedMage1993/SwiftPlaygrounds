import UIKit

let someBadIntString = "23 & 307"
let someGoodIntString = "52"
let emptyIntString = ""

func sauce(_ string: String) {
    guard let attemptCastInt = Int(string) else { return }
    
    print(attemptCastInt)
}

sauce(someBadIntString)
sauce(someGoodIntString)
sauce(emptyIntString)

print("No crash")

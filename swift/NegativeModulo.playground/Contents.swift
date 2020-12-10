import UIKit

infix operator >%: MultiplicationPrecedence

extension Int {
    static func >%(left: Int, right: Int) -> Int {
        precondition(right > 0, "Modulus must be positive.")
        let remainder = left % right
        return remainder >= 0 ? remainder : remainder + right
    }
}

// -1 0 1 2
print(-1 >% 3) // prints 2; visualize going left of 0 would result in 2 by looping around


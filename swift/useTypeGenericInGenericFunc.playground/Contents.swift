import UIKit

protocol Sauce {
    func bob<GenFuncType>(seed: GenFuncType) -> GenFuncType
}

struct Apple<TypeGen>: Sauce {
    
    func bob<GenFuncType>(seed: GenFuncType) -> GenFuncType {
        return seed
    }
}


let poop = Apple<Int>()

poop.bob(seed: 5)
poop.bob(seed: "")

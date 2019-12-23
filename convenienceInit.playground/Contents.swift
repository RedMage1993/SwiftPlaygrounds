import UIKit

class ClassWithConvenience {
    init() {
        
    }
    
    init(wParam: Int, lParam: Int) {
        
    }
    
    convenience init(meta: Bool) {
        self.init(wParam: 0, lParam: 0)
    }
}

class SubclassOfClassWithConvenienceHasNoProperties: ClassWithConvenience {}

/**
 You cannot override the convenience initializer from the base class here.
 
 You cannot call that super init from the subclass' initializer because the super's convenience initializer is not a designated initializer.
 
 The purpose of convenience is for convenience but also to not bloat subclasses.
 */
class SubclassOfClassWithConvenienceHasProperties: ClassWithConvenience {
    let aProperty: Int
    
    override init() {
        aProperty = 0
        super.init()
    }
}

import UIKit

protocol CodableStreamConfiguration {}

protocol CodableStream {
    associatedtype Configuration: CodableStreamConfiguration
    
    var configuration: Configuration { get set }
}

protocol ProvidesCodableStreamService {
    
}

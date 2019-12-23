// Fritz Ammon
// a kind of dependency injection lol
 
// MARK: - Service abstraction
public protocol Service: class {
    var serviceName: String { get }
 
    func actually<T>(_ type: T.Type) -> T
}
 
public extension Service {
    var serviceName: String {
        return String(describing: self)
    }
    
    func actually<T>(_ type: T.Type) -> T {
        return self as! T
    }
}
 
// MARK: - Concrete services
public class Fuark {
    public var sauce = "Apple from \(Fuark.name)"
}
 
public class Delta {
    public var scape = "Espada-san, Delta"
}

// MARK: - Services
extension Fuark: Service {}
extension Delta: Service {}
 
// MARK: - Service Locator
public protocol ServiceLocator: class {
    var services: [String: Service] { get set }
 
    func add(service: Service)
}

public extension ServiceLocator {
    func add(service: Service) {
        services[service.serviceName] = service
    }
}
 
public final class SDServices: ServiceLocator {
    public var services = [String: Service]()
}
 
public extension SDServices {
    func add(_ key: String, service: Service) {
        services[key] = service
    }
}
 
// MARK: - Dependency injector
public protocol Injector: class {
    var serviceLocator: ServiceLocator? { get set }
 
    func execute(_ serviceNames: String..., block: ([Service]) -> Void)
}
 
public final class SDInjector: Injector {
    public var serviceLocator: ServiceLocator?
 
    public func execute(_ serviceNames: String..., block: ([Service]) -> Void) {
        // Can exit and not call block if a service cannot be found, or let it call
        // at which point we can expect a crash which points something wrong in the logic
        block(serviceNames.compactMap { self.serviceLocator?.services[$0] })
    }
}
 
// MARK: - main
public final class SD {
    public lazy var sdInjector: Injector = {
        let injector = SDInjector()
        let serviceLocator = SDServices()
 
        serviceLocator.add(Fuark.name, service: Fuark())
        serviceLocator.add(Delta.name, service: Delta())
 
        injector.serviceLocator = serviceLocator
 
        return injector
    }()
 
    public func main() {
        sdInjector.execute(Fuark.name, Delta.name) { services in
            var mutableServices = services
 
            let fuark = mutableServices.removeFirst().actually(Fuark.self)
            let delta = mutableServices.removeFirst().actually(Delta.self)
 
            print(fuark.sauce)
            print(delta.scape)
        }
    }
}
 
let sd = SD()
 
sd.main()

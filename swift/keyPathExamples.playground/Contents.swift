import Foundation

var urlString = "Slickdeals://BlackFriday"
 
extension String {
    func lowercasing(_ component: WritableKeyPath<URLComponents, String?>) -> String     {
        guard var urlComponents = URLComponents(string: self) else { return self }
        urlComponents[keyPath: component] = urlComponents[keyPath: component]?.lowercased()
        return urlComponents.string ?? self
    }
}
 
print(urlString.lowercasing(\.scheme)) // prints "slickdeals://BlackFriday"
 
print(urlString.lowercasing(\.host)) // prints "Slickdeals://blackfriday"

//-=-=-=-=-=-=-=-=-=-=-=-=

// Reason for below is because ForEach in SwiftUI uses KeyPaths and wanted to confirm the string literals were really being used as Hashable ID's
let literal = "garbage"
print(literal.self)
 
let pets = ["cat", "dog", "lizard"]
 
func sauce<Data: RandomAccessCollection, ID: Hashable>(ka: Data, pow: KeyPath<Data.Element, ID>) {
    print(ka)
    print(pow)
    ka.forEach { print($0[keyPath: pow]) }
}
 
sauce(ka: pets, pow: \.description)

//-=-=-=-=-=-=-=-=-=-=-=-=

// Converting an array of objects with a (hashable) "key" and "value" into a dictionary of KV pairs
extension Array {
    func toDictionary<K: Hashable, V>(keyPathForKey: KeyPath<Element, K>, keyPathForValue: KeyPath<Element, V>) -> [K: V] {
        return Dictionary(map { ($0[keyPath: keyPathForKey], $0[keyPath: keyPathForValue]) } ) { $1 }
    }
}
 
struct ContextData {
    var key: String
    var value: String
}
 
var contextData: [ContextData]?
 
var convertedAnalyticsProperties: [String: Any] { return contextData?.toDictionary(keyPathForKey: \.key, keyPathForValue: \.value) ?? [:] }
 
print(convertedAnalyticsProperties)
 
contextData = []
 
print(convertedAnalyticsProperties)
 
contextData = [
    ContextData(key: "uh", value: "ok"),
    ContextData(key: "uh", value: "bye"),
    ContextData(key: "uh2", value: "hi")
]
 
print(convertedAnalyticsProperties)

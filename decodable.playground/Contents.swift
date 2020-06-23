import UIKit

let json =
"""
{
    "badge": 1
}
"""



struct Acc: Decodable {
    let badge: Int?
    let test: Bool?
}

let data = json.data(using: .utf8)!

let decoded = try JSONDecoder().decode(Acc.self, from: data)

print(decoded)

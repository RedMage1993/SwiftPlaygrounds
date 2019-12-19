import UIKit

let alertWithTitleAndBody: [String: Any] = [
    "aps": [
        "alert": [
            "title": "FCM Test",
            "body": "This is a FCM test."
        ]
    ]
]

let alertWithBody: [String: Any] = [
    "aps": [
        "alert": "This is a FCM test."
    ]
]

// MARK: - ApnsPush
struct ApnsPush: Codable {
    let aps: Aps
}

// MARK: - Aps
extension ApnsPush {
    struct Aps: Codable {
        let alert: Alert
        let category: String?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            alert = try container.decode(Alert.self, forKey: .alert)
            category = try container.decodeIfPresent(String.self, forKey: .category)
        }
    }
}

// MARK: - Alert
extension ApnsPush {
    struct Alert: Codable {
        let title, subtitle, body: String?
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decodeIfPresent(String.self, forKey: .title)
            subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
            body = try container.decodeIfPresent(String.self, forKey: .body)
        }
    }
}

if let alertWithTitleAndBodyJsonData = try? JSONSerialization.data(withJSONObject: alertWithTitleAndBody, options: .prettyPrinted),
   let alertWithTitleAndBody = try? JSONDecoder().decode(ApnsPush.self, from: alertWithTitleAndBodyJsonData) {
    print(alertWithTitleAndBody)
}

if let alertWithBodyJsonData = try? JSONSerialization.data(withJSONObject: alertWithTitleAndBody, options: .prettyPrinted),
   let alertWithBody = try? JSONDecoder().decode(ApnsPush.self, from: alertWithBodyJsonData) {
    print(alertWithBody)
}

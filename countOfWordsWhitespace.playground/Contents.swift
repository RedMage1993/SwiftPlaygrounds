import UIKit

let sampleText = " sentence with dumb whitespace "

var countOfWords = sampleText.components(separatedBy: .whitespacesAndNewlines).count

print("\(countOfWords) words < 5 == \(countOfWords < 5)") // prints false

countOfWords = sampleText.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .whitespacesAndNewlines).count

print("\(countOfWords) words < 5 == \(countOfWords < 5)") // prints true

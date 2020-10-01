import Foundation

func getImageData() -> Data? {
    let imageURLString = "https://www.godlyplayfoundation.org/wp-content/uploads/2016/06/Target-receipt-2.jpg"
    guard let imageURL = URL(string: imageURLString) else { return nil }
    return try? Data(contentsOf: imageURL)
}

func printImageData() {
    guard let imageData = getImageData() else { return }
    
    var byteArray = Array<UInt8>(repeating: 0, count: imageData.count)
    
    let result = byteArray.withUnsafeMutableBytes {
        imageData.copyBytes(to: $0, from: imageData.startIndex..<imageData.endIndex)
    }
    
    print(byteArray)
}

printImageData()

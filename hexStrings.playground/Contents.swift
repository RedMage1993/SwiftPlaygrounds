import UIKit

func UIColorFromRGB(_ colorCode: String, alpha: Float = 1.0) -> UIColor {
    var tempColorCode = colorCode
    if tempColorCode.hasPrefix("#") {
        tempColorCode.removeFirst()
    }
    
    let scanner = Scanner(string:tempColorCode)
    var color:UInt32 = 0;
    scanner.scanHexInt32(&color)
    
    let mask = 0x000000FF
    let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
    let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
    let b = CGFloat(Float(Int(color) & mask)/255.0)
    
    return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
}

extension UIColor {
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? (r, g, b, a) : (0, 0, 0, 0)
    }
    var hexString: String {
        return String(format: "%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255))
    }
}

UIColor.clear.rgbComponents

UIColor(red: 0, green: 0, blue: 0, alpha: 1).rgbComponents



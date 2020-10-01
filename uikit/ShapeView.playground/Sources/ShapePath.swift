import Foundation
import UIKit

public protocol DefinesShapePath {
    func createShapePath() -> UIBezierPath
}

public struct ShapePath {}

public extension ShapePath {
    struct EquilateralTriangle {
        let direction: Direction
        let height: CGFloat
    }
}

public extension ShapePath.EquilateralTriangle {
    enum Direction {
        case up
        case right
        case down
        case left
    }
}

extension ShapePath.EquilateralTriangle: DefinesShapePath {
    private func calculateSideLength() -> CGFloat {
        return (1.0 / 0.75).squareRoot() * height
    }
    
    public func createShapePath() -> UIBezierPath {
        let shapePath = UIBezierPath()
        
        
        
        return shapePath
    }
}

public protocol HasDrawnShapeInfo {
    func getShapeSize() -> CGSize
}

public protocol CanDisplayShape {}

public protocol CreatesDisplayableFormOfShapePath {
    associatedtype ShapeCanvas: CanDisplayShape & HasDrawnShapeInfo // allows functionality to be extended onto other types rather than to limit this to only UIView

    var shapePathGenerator: DefinesShapePath { get }

    func createShapeDisplayable() -> ShapeCanvas
}

extension UIView: CanDisplayShape {}

public class ShapeView: UIView {}

extension ShapeView: HasDrawnShapeInfo {
    public func getShapeSize() -> CGSize {
        return frame.size // a ShapeView will be resized to be a sizeThatFits the shape; its frame size will represent the shape's size
    }
}

public struct ShapeViewCreator {
    public let shapePathGenerator: DefinesShapePath
}

// can be reused for a lot of shape paths, and you'll only ever need to reimpliment this for other "CanDisplayShape" types like UIView subclasses
extension ShapeViewCreator: CreatesDisplayableFormOfShapePath {
    public func createShapeDisplayable() -> ShapeView {
        // draw and resize uiview
        return ShapeView()
    }
}

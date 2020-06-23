//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// TODO: - try getting a view for a triangle shape, give a height and direction

extension UIView {
    func add(subview: UIView, cover: Bool = false) {
        addSubview(subview)
        
        guard cover else { return }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.leftAnchor.constraint(equalTo: leftAnchor),
            subview.rightAnchor.constraint(equalTo: rightAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        super.loadView()
        
        print(1 % -3)
        
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

let myVc = MyViewController()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = myVc.view

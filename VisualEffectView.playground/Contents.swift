//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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
    let blurEffect = UIBlurEffect(style: .dark)
    
    lazy var vv: UIVisualEffectView = {
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        return UIVisualEffectView(effect: vibrancyEffect)
    }()
    
    var niceBgImageView: UIImageView = {
        let niceBg = UIImageView()
        niceBg.image = UIImage(named: "nicebg.jpg")
        niceBg.contentMode = .scaleAspectFill
        return niceBg
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let bv = UIVisualEffectView(effect: blurEffect)
        bv.contentView.add(subview: vv, cover: true)
        return bv
    }()
    
    var label: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "A label added to the contentView of a VisualEffectView."
        
        vv.contentView.add(subview: label, cover: true)
        
        view.add(subview: niceBgImageView, cover: true)
        
        niceBgImageView.add(subview: blurView, cover: true)
    }
}

let myVc = MyViewController()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = myVc.view

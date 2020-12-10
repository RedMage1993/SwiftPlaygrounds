//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIView {
    func add(subview: UIView, margins: UIEdgeInsets = .zero) {
        addSubview(subview)

        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.leftAnchor.constraint(equalTo: leftAnchor, constant: margins.left),
            subview.rightAnchor.constraint(equalTo: rightAnchor, constant: -margins.right),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margins.bottom),
            subview.topAnchor.constraint(equalTo: topAnchor, constant: margins.top)
        ])
    }
}

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
        view.backgroundColor = .black
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.separatorInset = .zero
        
        view.add(subview: tableView)
        
        self.view = view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect at \(indexPath.description)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .red
        
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle(indexPath.description, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        cell.contentView.add(subview: button, margins: UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30))
        
        return cell
    }
    
    @objc func buttonTapped(sender: UIButton!) {
        print("buttonTapped at \(sender.titleLabel!.text!)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}

let sauce = MyViewController()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = sauce

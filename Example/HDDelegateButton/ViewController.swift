import UIKit
import HDDelegateButton

class ViewController: UIViewController, ButtonDelegate {
    private lazy var button: HDDelegateButton = {
        let button = HDDelegateButton(type: .roundedRect)
        button.delegate = self
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Hit me!!!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.button)
    }
    
    override func viewWillLayoutSubviews() {
        self.view.frame = UIScreen.main.bounds
        
        let height: CGFloat = 40
        let width: CGFloat = self.view.frame.width * 0.5
        self.button.frame = CGRect(x: (self.view.frame.width - width) * 0.5,
                                   y: (self.view.frame.height - height) * 0.5,
                                   width: width,
                                   height: height)
        self.button.layer.cornerRadius = height * 0.5
        
        return
    }
    
    //MARK:- ButtonDelegate
    func touchUpInside(sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "Tapped!!!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        return
    }
}

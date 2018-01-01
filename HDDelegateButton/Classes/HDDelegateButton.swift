import UIKit

/**
 You can implement button as delegate pattern.
 ```swift
 class CustomViewController: UIViewController, ButtonDelegate {
    //MARK:- Components
    private lazy var button = HDDelegateButton()
 
    //MARK:- Life cycle events
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addSubView(self.button)
        self.button.delegate = self
    }
 
    //MARK:- ButtonDelegate
    func touchUpInside(sender: UIButton)
    {
        print("Tapped!!!")
    }
 }
 ```

 */
open class HDDelegateButton: UIButton {
    //MARK:- Properties
    open weak var delegate: ButtonDelegate? {
        get
        {
            return self.delegatePointer
        }
        set {
            self.delegatePointer = newValue
            super.addTarget(self,
                            action: #selector(self.touchDownRepeat(sender:)),
                            for: .touchDownRepeat)
            super.addTarget(self,
                            action: #selector(self.touchDragEnter(sender:)),
                            for: .touchDragEnter)
            super.addTarget(self,
                            action: #selector(self.touchDragExit(sender:)),
                            for: .touchDragExit)
            super.addTarget(self,
                            action: #selector(self.touchDragInside(sender:)),
                            for: .touchDragInside)
            super.addTarget(self,
                            action: #selector(self.touchDragOutside(sender:)),
                            for: .touchDragOutside)
            super.addTarget(self,
                            action: #selector(self.touchUpInside(sender:)),
                            for: .touchUpInside)
            super.addTarget(self,
                            action: #selector(self.touchUpOutside(sender:)),
                            for: .touchUpOutside)
        }
    }

    //MARK:- Methods
    open override func addTarget(_ target: Any?,
                                 action: Selector,
                                 for controlEvents: UIControlEvents)
    {
        super.addTarget(target, action: action, for: controlEvents)
        print("It is prefer to set action through ButtonDelegate than through addTarget.")
        return
    }

    //MARK:- Privates
    private weak var delegatePointer: ButtonDelegate?
    
    @objc private func touchDownRepeat(sender: UIButton)
    {
        self.delegate?.touchDownRepeat(sender: sender)
    }
    
    @objc private func touchDragEnter(sender: UIButton)
    {
        self.delegate?.touchDragEnter(sender: sender)
        return
    }
    
    @objc private func touchDragExit(sender: UIButton)
    {
        self.delegate?.touchDragExit(sender: sender)
        return
    }
    
    @objc private func touchDragInside(sender: UIButton)
    {
        self.delegate?.touchDragInside(sender: sender)
        return
    }
    
    @objc private func touchDragOutside(sender: UIButton)
    {
        self.delegate?.touchDragOutside(sender: sender)
        return
    }
    
    @objc private func touchUpInside(sender: UIButton)
    {
        self.delegate?.touchUpInside(sender: sender)
        return
    }
    
    @objc private func touchUpOutside(sender: UIButton)
    {
        self.delegate?.touchUpOutside(sender: sender)
        return
    }
}

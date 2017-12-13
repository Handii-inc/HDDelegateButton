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
    
    @objc private func doAction(_ sender: UIButton,
                                action methodOrNil: ((UIButton) -> Void)?)
    {
        guard let method = methodOrNil else {
            return  //do nothing
        }
        method(sender)
        return
    }
    
    @objc private func touchDownRepeat(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchDownRepeat)
        return
    }
    
    @objc private func touchDragEnter(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchDragEnter)
        return
    }
    
    @objc private func touchDragExit(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchDragExit)
        return
    }
    
    @objc private func touchDragInside(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchDragInside)
        return
    }
    
    @objc private func touchDragOutside(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchDragOutside)
        return
    }
    
    @objc private func touchUpInside(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchUpInside)
        return
    }
    
    @objc private func touchUpOutside(sender: UIButton)
    {
        self.doAction(sender, action: self.delegatePointer?.touchUpOutside)
        return
    }
}

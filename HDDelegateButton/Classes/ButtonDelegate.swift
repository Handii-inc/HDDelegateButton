import Foundation
import UIKit

/**
 Delegate for DelegateButton. Method name compatible with [UIControlEvents](https://developer.apple.com/documentation/uikit/uicontrolevents).
 Please implement me and setting DelegateButton's property.
 ```swift
 class CustomViewController: UIViewController, ButtonDelegate {
 //MARK:- Components
 private lazy var button = DelegateButton()
 
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
public protocol ButtonDelegate: class {
    /**
     Compatible with [UIControlEvnets.touchDownRepeat](https://developer.apple.com/documentation/uikit/uicontrolevents/1618223-touchdownrepeat)
     */
    func touchDownRepeat(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragEnter](https://developer.apple.com/documentation/uikit/uicontrolevents/1618209-touchdragenter)
     */
    func touchDragEnter(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragExit](https://developer.apple.com/documentation/uikit/uicontrolevents/1618257-touchdragexit)
     */
    func touchDragExit(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragInside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618240-touchdraginside)
     */
    func touchDragInside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragOutside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618242-touchdragoutside)
     */
    func touchDragOutside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchUpInside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618236-touchupinside)
     */
    func touchUpInside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchUpOutside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618258-touchupoutside)
     */
    func touchUpOutside(sender: UIButton)
}

public extension ButtonDelegate {
    func touchDownRepeat(sender: UIButton)
    {
        return  //do nothing
    }
    
    func touchDragEnter(sender: UIButton)
    {
        return  //do nothing
    }

    func touchDragExit(sender: UIButton)
    {
        return  //do nothing
    }

    func touchDragInside(sender: UIButton)
    {
        return  //do nothing
    }

    func touchDragOutside(sender: UIButton)
    {
        return  //do nothing
    }

    func touchUpInside(sender: UIButton)
    {
        return  //do nothing
    }

    func touchUpOutside(sender: UIButton)
    {
        return  //do nothing
    }
}


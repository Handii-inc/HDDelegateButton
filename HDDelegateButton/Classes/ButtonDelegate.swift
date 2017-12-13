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
@objc public protocol ButtonDelegate: class {
    /**
     Compatible with [UIControlEvnets.touchDownRepeat](https://developer.apple.com/documentation/uikit/uicontrolevents/1618223-touchdownrepeat)
     */
    @objc optional func touchDownRepeat(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragEnter](https://developer.apple.com/documentation/uikit/uicontrolevents/1618209-touchdragenter)
     */
    @objc optional func touchDragEnter(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragExit](https://developer.apple.com/documentation/uikit/uicontrolevents/1618257-touchdragexit)
     */
    @objc optional func touchDragExit(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragInside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618240-touchdraginside)
     */
    @objc optional func touchDragInside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchDragOutside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618242-touchdragoutside)
     */
    @objc optional func touchDragOutside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchUpInside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618236-touchupinside)
     */
    @objc optional func touchUpInside(sender: UIButton)
    
    /**
     Compatible with [UIControlEvnets.touchUpOutside](https://developer.apple.com/documentation/uikit/uicontrolevents/1618258-touchupoutside)
     */
    @objc optional func touchUpOutside(sender: UIButton)
}


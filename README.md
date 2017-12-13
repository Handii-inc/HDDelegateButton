# DelegateButton

[![CI Status](http://img.shields.io/travis/Handii-inc/DelegateButton.svg?style=flat)](https://travis-ci.org/Handii-inc/DelegateButton)
[![Version](https://img.shields.io/cocoapods/v/DelegateButton.svg?style=flat)](http://cocoapods.org/pods/DelegateButton)
[![License](https://img.shields.io/cocoapods/l/DelegateButton.svg?style=flat)](http://cocoapods.org/pods/DelegateButton)
[![Platform](https://img.shields.io/cocoapods/p/DelegateButton.svg?style=flat)](http://cocoapods.org/pods/DelegateButton)

## Description

Redesign UIButton as delegate pattern.

Let's change addTarget to ButtonDelegate n your code.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

## Installation

DelegateButton is available through [CocoaPods](http://cocoapods.org). 
To instal it, simply add the following line to your Podfile:

```ruby
pod "DelegateButton"
```

## Author

Handii-inc, swift@handii.co.jp

## License

DelegateButton is available under the MIT license. See the LICENSE file for more info.

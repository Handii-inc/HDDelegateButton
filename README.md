# HDDelegateButton

[![CI Status](http://img.shields.io/travis/Handii-inc/HDDelegateButton.svg?style=flat)](https://travis-ci.org/Handii-inc/HDDelegateButton)
[![Version](https://img.shields.io/cocoapods/v/HDDelegateButton.svg?style=flat)](http://cocoapods.org/pods/HDDelegateButton)
[![License](https://img.shields.io/cocoapods/l/HDDelegateButton.svg?style=flat)](http://cocoapods.org/pods/HDDelegateButton)
[![Platform](https://img.shields.io/cocoapods/p/HDDelegateButton.svg?style=flat)](http://cocoapods.org/pods/HDDelegateButton)

## Description

Redesign UIButton as delegate pattern.

Let's change addTarget to ButtonDelegate n your code.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

## Installation

HDDelegateButton is available through [CocoaPods](http://cocoapods.org). 
To instal it, simply add the following line to your Podfile:

```ruby
pod "HDDelegateButton"
```

## Author

Handii-inc, github@handii.co.jp

## License

HDDelegateButton is available under the MIT license. See the LICENSE file for more info.

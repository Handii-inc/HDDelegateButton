// https://github.com/Quick/Quick

import Quick
import HDDelegateButton

class AllMethodDefinedDelegate: ButtonDelegate {
    func check()
    {
        let assertIfNeeded = { (count: Int, name: String) in
            if (count < 0) {
                XCTFail(name + " has been called over the number of times than expected.")
            }
            if (count > 0) {
                XCTFail(name + " has not been called the expected number of times yet.")
            }
            return
        }
        assertIfNeeded(self.counter.touchDownRepeat, "touchDownRepeat")
        assertIfNeeded(self.counter.touchDragEnter, "touchDragEnter")
        assertIfNeeded(self.counter.touchDragExit, "touchDragExit")
        assertIfNeeded(self.counter.touchDragInside, "touchDragInside")
        assertIfNeeded(self.counter.touchDragOutside, "touchDragOutside")
        assertIfNeeded(self.counter.touchUpInside, "touchUpInside")
        assertIfNeeded(self.counter.touchUpOutside, "touchUpOutside")
    }
    
    func will(_ event: UIControlEvents)
    {
        switch event {
        case .touchDownRepeat:
            self.counter.touchDownRepeat += 1
        case .touchDragEnter:
            self.counter.touchDragEnter += 1
        case .touchDragExit:
            self.counter.touchDragExit += 1
        case .touchDragInside:
            self.counter.touchDragInside += 1
        case .touchDragOutside:
            self.counter.touchDragOutside += 1
        case .touchUpInside:
            self.counter.touchUpInside += 1
        case .touchUpOutside:
            self.counter.touchUpOutside += 1
        default:
            break
        }
        return
    }
    
    func touchDownRepeat(sender: UIButton)
    {
        self.counter.touchDownRepeat -= 1
    }
    
    func touchDragEnter(sender: UIButton)
    {
        self.counter.touchDragEnter -= 1
    }
    
    func touchDragExit(sender: UIButton)
    {
        self.counter.touchDragExit -= 1
    }
    
    func touchDragInside(sender: UIButton)
    {
        self.counter.touchDragInside -= 1
    }
    
    func touchDragOutside(sender: UIButton)
    {
        self.counter.touchDragOutside -= 1
    }
    
    func touchUpInside(sender: UIButton)
    {
        self.counter.touchUpInside -= 1
    }
    
    func touchUpOutside(sender: UIButton)
    {
        self.counter.touchUpOutside -= 1
    }
    
    private let counter: Counter = Counter()
    private class Counter {
        var touchDownRepeat: Int = 0
        var touchDragEnter: Int = 0
        var touchDragExit: Int = 0
        var touchDragInside: Int = 0
        var touchDragOutside: Int = 0
        var touchUpInside: Int = 0
        var touchUpOutside: Int = 0
    }
}

class NoMethodDefinedDelegate: ButtonDelegate {
}

class MockButton: HDDelegateButton {
    override func sendActions(for controlEvents: UIControlEvents) {
        guard let obj = self.delegate else {
            return
        }
        
        switch controlEvents {
        case UIControlEvents.touchDownRepeat:
            obj.touchDownRepeat?(sender: self)
        case UIControlEvents.touchDragEnter:
            obj.touchDragEnter?(sender: self)
        case UIControlEvents.touchDragExit:
            obj.touchDragExit?(sender: self)
        case UIControlEvents.touchDragInside:
            obj.touchDragInside?(sender: self)
        case UIControlEvents.touchDragOutside:
            obj.touchDragOutside?(sender: self)
        case UIControlEvents.touchUpInside:
            obj.touchUpInside?(sender: self)
        case UIControlEvents.touchUpOutside:
            obj.touchUpOutside?(sender: self)
        default:
            break
        }
        
        return
    }
}

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("send action to delegate through button") {
            let delegate = AllMethodDefinedDelegate()
            let button = MockButton()
            button.delegate = delegate
            
            context("with all methods difined delegate") {
                it("call touchDownRepeat") {
                    delegate.will(.touchDownRepeat)
                    button.sendActions(for: .touchDownRepeat)
                    delegate.check()
                }
                it("call touchDragEnter") {
                    delegate.will(.touchDragEnter)
                    button.sendActions(for: .touchDragEnter)
                    delegate.check()
                }
                it("call touchDragExit") {
                    delegate.will(.touchDragExit)
                    button.sendActions(for: .touchDragExit)
                    delegate.check()
                }
                it("call touchDragInside") {
                    delegate.will(.touchDragInside)
                    button.sendActions(for: .touchDragInside)
                    delegate.check()
                }
                it("call touchDragOutside") {
                    delegate.will(.touchDragOutside)
                    button.sendActions(for: .touchDragOutside)
                    delegate.check()
                }
                it("call touchUpInside") {
                    delegate.will(.touchUpInside)
                    button.sendActions(for: .touchUpInside)
                    delegate.check()
                }
                it("call touchUpOutside") {
                    delegate.will(.touchUpOutside)
                    button.sendActions(for: .touchUpOutside)
                    delegate.check()
                }
            }
            context("with no methods difined delegate") {
                let delegate = NoMethodDefinedDelegate()
                let button = MockButton()
                button.delegate = delegate
                
                it("never through") {
                    button.sendActions(for: .touchDownRepeat)
                    button.sendActions(for: .touchDragEnter)
                    button.sendActions(for: .touchDragExit)
                    button.sendActions(for: .touchDragInside)
                    button.sendActions(for: .touchDragOutside)
                    button.sendActions(for: .touchUpInside)
                    button.sendActions(for: .touchUpOutside)
                }
                
            }
        }
    }
}

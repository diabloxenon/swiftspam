//
//  BackgroundGradientView.swift
//
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

class BackgroundGradientView: UIView {
    class func preferredStartColor() -> UIColor {
        // return UIColor(named: "gradientStart") ?? .white
        return UIColor(red:181/255.0, green:181/255.0, blue:73/255.0, alpha:1.0)
    }
    
    class func preferredEndColor() -> UIColor {
        // return UIColor(named: "gradientEnd") ?? .black
        return UIColor(red:203/255.0, green:203/255.0, blue:160/255.0, alpha:1.0)
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    private var startColor: UIColor = .white
    private var endColor: UIColor = .white
    
    required convenience init(startColor: UIColor, endColor: UIColor) {
        self.init()
        
        self.startColor = startColor
        self.endColor = endColor
        
        let layer = self.layer as! CAGradientLayer
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    class func backgroundWithPreferredColors() -> BackgroundGradientView {
        return BackgroundGradientView(startColor: preferredStartColor(), endColor: preferredEndColor())
    }
}

class BackgroundGradientViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    override func loadView() {
        self.view = BackgroundGradientView.backgroundWithPreferredColors()
    }
    
}

//
//  Frame.swift
//
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.
//
//  ...
//
//  Canvas.swift part of Shapes.playgroundbook
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

public class Frame {
    public static let shared = Frame()
    internal let backingView: UIView = UIView()
    private init() {
        // To resize the view for playgrounds
        backingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

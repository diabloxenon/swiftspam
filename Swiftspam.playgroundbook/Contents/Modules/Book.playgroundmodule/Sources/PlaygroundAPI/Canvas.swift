
//
//  Canvas.swift
//
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

/// The surface that all objects are added to. The canvas center point is (0,0) and is located in the visual center of the canvas.
/// - localizationKey: Canvas
public class Canvas {
    
    public static let shared = Canvas()
    
    internal let backingView: UIView = FrameChangeNotifyingView()
    
    private init() {
        
        backingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        let frameChangeNotifyingView = backingView as! FrameChangeNotifyingView
        frameChangeNotifyingView.frameChangeDelegate = self
    }
    
}

extension Canvas: FrameChangeDelegate {
    func frameDidChange() {
    }
}

private protocol FrameChangeDelegate: class {
    func frameDidChange()
}

private class FrameChangeNotifyingView: UIView {

    weak var frameChangeDelegate: FrameChangeDelegate?
    
    private var previousFrame = CGRect.zero
    
    fileprivate override func layoutSubviews() {
        super.layoutSubviews()
        
        // only notify the delegate if the frame actually changed.
        if (previousFrame != frame) {
            frameChangeDelegate?.frameDidChange()
        }
        previousFrame = frame
    }
    
}


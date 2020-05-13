//
//  Setup.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
import UIKit
import PlaygroundSupport

// Setup the canvas layout for full view
public func _setup() {
    let viewController = UIViewController()
    viewController.view.addSubview(Frame.shared.backingView)
    PlaygroundPage.current.liveView = viewController
}

// Starts the Swiftspam engine
public func _start() {
    PlaygroundPage.current.setLiveView(hosting)
}
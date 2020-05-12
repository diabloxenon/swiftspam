//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, _setup())
//#-code-completion(identifier, hide, AbstractDrawable)
//#-code-completion(identifier, hide, _ColorLiteralType)
//#-hidden-code
_setup()
//#-end-hidden-code
//#-editable-code Tap to enter code
//#-localizable-zone(touchk1)
// create a circle and make it draggable.
//#-end-localizable-zone
let circle = Circle(radius: 7.0)
circle.color = Color.blue
circle.draggable = true

//#-localizable-zone(touchk2)
// when the circle is touched, make it darker and give it a shadow.
//#-end-localizable-zone
circle.onTouchDown {
    circle.color = circle.color.darker()
    circle.dropShadow = Shadow()
}

//#-localizable-zone(touchk3)
// when the touch ends on the circle, change its color to a random color.
//#-end-localizable-zone
circle.onTouchUp {
    circle.color = Color.random()
    circle.dropShadow = nil
}

//#-localizable-zone(touchk4)
// jump the circle to the point on the canvas that was touched.
//#-end-localizable-zone
Canvas.shared.onTouchUp {
    circle.center = Canvas.shared.currentTouchPoints.first!
    circle.dropShadow = Shadow()
}

//#-end-editable-code

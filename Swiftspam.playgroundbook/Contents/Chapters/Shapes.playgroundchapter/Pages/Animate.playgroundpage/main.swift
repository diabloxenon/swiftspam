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
//#-localizable-zone(animatek1)
// create a line.
//#-end-localizable-zone
let line = Line(start: Point(x: -10, y: 0), end: Point(x: 10, y: 0))
line.color = .blue
line.center.y += 6

//#-localizable-zone(animatek2)
// create a Text object that, when touched, will kick off the clockwise rotation animation.
//#-end-localizable-zone
let rotateClockwiseText = Text(string: "/*#-localizable-zone(rotateClockwiseText)*/Rotate Line Clockwise/*#-end-localizable-zone*/", fontSize: 21.0)
rotateClockwiseText.color = .blue
rotateClockwiseText.center.y -= 7

//#-localizable-zone(animatek3)
// create a Text object that, when touched, will kick off the counter-clockwise rotation animation.
//#-end-localizable-zone
let rotateCounterClockwiseText = Text(string: "/*#-localizable-zone(rotateCounterClockwiseText)*/Rotate Line Counter Clockwise/*#-end-localizable-zone*/", fontSize: 21.0)
rotateCounterClockwiseText.color = .blue
rotateCounterClockwiseText.center.y -= 12

//#-localizable-zone(animatek4)
// rotate the line clockwise with animation when the "Rotate Line Clockwise" text is touched.
//#-end-localizable-zone
rotateClockwiseText.onTouchUp {
    animate {
        line.rotation += Double.pi / 4
    }
}

//#-localizable-zone(animatek5)
// rotate the line counter clockwise with animation when the "Rotate Line Counter Clockwise" text is touched.
//#-end-localizable-zone
rotateCounterClockwiseText.onTouchUp {
    animate {
        line.rotation -= Double.pi / 4
    }
}

//#-end-editable-code

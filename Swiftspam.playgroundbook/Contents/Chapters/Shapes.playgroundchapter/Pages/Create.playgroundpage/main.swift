//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, AbstractDrawable, _ColorLiteralType, _setup())
//#-hidden-code
_setup()
//#-end-hidden-code
//#-editable-code Tap to enter code
//#-localizable-zone(createk1)
// 1. Create a circle
//#-end-localizable-zone
let circle = Circle(radius: 3)
circle.center.y += 19

//#-localizable-zone(createk2)
// 2. Create a rectangle
//#-end-localizable-zone
let rectangle = Rectangle(width: 10, height: 5, cornerRadius: 0.75)
rectangle.color = .red
rectangle.center.y += 12

//#-localizable-zone(createk3)
// 3. Create a line
//#-end-localizable-zone
let line = Line(start: Point(x: -10, y: 9), end: Point(x: 10, y: 9), thickness: 0.5)
line.center.y -= 3
line.rotation = 170 * (Double.pi / 180)
line.color = .yellow

//#-localizable-zone(createk4)
// 4. Create text
//#-end-localizable-zone
let text = Text(string: "/*#-localizable-zone(helloWorldText)*/Hello world!/*#-end-localizable-zone*/", fontSize: 32.0, fontName: "Futura")
text.center.y -= 0

//#-localizable-zone(createk5)
// 5. Create an image
//#-end-localizable-zone
let image = Image(name: "SwiftBird", tint: .green)
image.size.width *= 0.5
image.size.height *= 0.5
image.center.y -= 7

//#-localizable-zone(createk6)
// 6. Create a pattern with rectangles
//#-end-localizable-zone
let numRectangles = 4
var xOffset = Double((numRectangles/2) * (-1))
var yOffset = -19.0
let saturationEnd = 0.911
let saturationStart = 0.1
let saturationStride = (saturationEnd - saturationStart)/Double(numRectangles)

for i in 0...numRectangles {
    
    let rectangle = Rectangle(width: 10, height: 5, cornerRadius: 0.75)
    
//#-localizable-zone(createk7)
    // set the color.
//#-end-localizable-zone
    let saturation = saturationEnd - (Double(numRectangles - i) * saturationStride)
    rectangle.color = Color(hue: 0.079, saturation: saturation, brightness: 0.934)
    
//#-localizable-zone(createk8)
    // calculate the offset.
//#-end-localizable-zone
    rectangle.center = Point(x: xOffset, y: yOffset)
    xOffset += 1
    yOffset += 1
}

//#-end-editable-code

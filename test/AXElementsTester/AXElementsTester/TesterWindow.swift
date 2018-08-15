//
//  TesterWindow.swift
//  AXElementsTester
//
//  Created by Mark Rada on 2014-10-19.
//  Copyright (c) 2014 Marketcircle Incorporated. All rights reserved.
//

import Cocoa

let AXLol                  = NSAccessibilityAttributeName(rawValue: "AXLol")
let AXPie                  = NSAccessibilityAttributeName(rawValue: "AXPie")
let AXIsNyan               = NSAccessibilityAttributeName(rawValue:"AXIsNyan")
let AXURLAttribute         = NSAccessibilityAttributeName(rawValue:"AXURL")
let AXDescriptionAttribute = NSAccessibilityAttributeName(rawValue:"AXDescription")
let AXData                 = NSAccessibilityAttributeName(rawValue:"AXData")

class TesterWindow : NSWindow {

    let extra_attrs : [NSAccessibilityAttributeName] = [
        AXLol,
        AXPie,
        AXIsNyan,
        AXURLAttribute,
        AXDescriptionAttribute,
        AXData
    ]

    override func accessibilityAttributeNames() -> [NSAccessibilityAttributeName] {
        return (super.accessibilityAttributeNames() as NSArray)
            .addingObjects(from: extra_attrs) as! [NSAccessibilityAttributeName]
    }

    override func accessibilityAttributeValue(_ name : NSAccessibilityAttributeName) -> Any? {
        if (name == AXLol) {
            return NSValue(rect: CGRect.zero)
        }
        if (name == AXPie) {
            return NSValue(range: NSRange(location: 10,length: 10))
        }
        if (name == AXIsNyan) {
            return false
        }
        if (name == AXURLAttribute) {
            return URL(string: "http://macruby.org/")
        }
        if (name == AXDescriptionAttribute) {
            return "Test Fixture"
        }
        if (name == AXData) {
            return (try? Data(contentsOf: URL(fileURLWithPath: "/bin/cat")))
        }
        return super.accessibilityAttributeValue(name)
    }

}

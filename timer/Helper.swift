//
//  Helper.swift
//  timer
//
//  Created by Tommy Le on 2016-05-03.
//  Copyright © 2016 Tommy Le. All rights reserved.
//

import Cocoa

class Helper: NSObject {
    static func NSColorFromRGB(rgbValue: UInt) -> NSColor {
        return NSColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

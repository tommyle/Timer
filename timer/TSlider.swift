//
//  TSlider.swift
//  timer
//
//  Created by Tommy Le on 2016-05-04.
//  Copyright © 2016 Tommy Le. All rights reserved.
//

import Cocoa

class TSlider: NSSlider {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let mouseLocation = NSEvent.mouseLocation()
        
        self.print( "Mouse Location X,Y = \(mouseLocation)" )
    }
}

//
//  TimerView.swift
//  timer
//
//  Created by Tommy Le on 2016-06-07.
//  Copyright © 2016 Tommy Le. All rights reserved.
//

import Cocoa
import ProgressKit

class TimerView: NSView {
    
    @IBOutlet var view: NSView!
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var progress: CircularProgressView!
    @IBOutlet weak var lblMinutes: NSTextField!
    @IBOutlet weak var lblSeconds: NSTextField!
    @IBOutlet weak var btnList: NSButton!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect);
        
        self.setup();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        
        self.setup();
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        NSColor.blueColor().setFill();
        NSRectFill(dirtyRect);
        
        // Drawing code here.
    }
    
    func setup() {
        NSBundle.mainBundle().loadNibNamed("TimerView", owner: self, topLevelObjects: nil);
        
        let contentFrame = NSMakeRect(0, 0, frame.size.width, frame.size.height)
        self.view.frame = contentFrame;
        self.addSubview(self.view);
        
        self.slider.alphaValue = 0.0
        //        self.slider.layer?.backgroundColor = NSColor.greenColor().CGColor
        self.slider.continuous = true
        
//        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
        self.slider.doubleValue = 1.0
        self.progress.progress = 1.0
        
        self.progress.setValue(Helper.NSColorFromRGB(0x323338), forKey: "background")
        self.progress.setValue(8, forKey: "strokeWidth")
        self.progress.setValue(false, forKey: "showPercent")
        self.progress.setValue(Helper.NSColorFromRGB(0x3BB3D4), forKey: "foreground")
        self.progress.setValue(1.0, forKey: "progress")
    }
}

//
//  ViewController.swift
//  timer
//
//  Created by Tommy Le on 2016-05-02.
//  Copyright © 2016 Tommy Le. All rights reserved.
//

import Cocoa
import ProgressKit
import AVFoundation

class ViewController: NSViewController {
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var progress: CircularProgressView!
    @IBOutlet weak var lblMinutes: NSTextField!
    @IBOutlet weak var lblSeconds: NSTextField!
    weak var timer = NSTimer?()
    var seconds: Int = 0
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.alphaValue = 0.0
        self.slider.continuous = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
        self.slider.doubleValue = 1.0
        self.progress.progress = 1.0
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.movableByWindowBackground = true
        self.view.window?.opaque = false;
        self.view.window?.backgroundColor = NSColor.clearColor()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        self.view.window?.setFrame(NSMakeRect(0, 0, 200, 220), display: true)
        
//        self.view.layer?.backgroundColor = NSColor.clearColor().CGColor
        //box.layer?.setNeedsDisplay()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func slider(sender : NSSlider) {
        let x: Double = sender.doubleValue
        progress.progress = CGFloat(x)
        seconds = 0
        
        self.lblMinutes.stringValue = String(format: "%02d", Int(self.progress.progress * 60))
        self.lblSeconds.stringValue = String(format: "%02d", seconds)
        
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    func updateCounter() {
        if (self.progress.progress <= 0 && seconds == 0) {
            timer?.invalidate();
            
            do {
                try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("kettle", ofType: "mp3")!), fileTypeHint:nil)
            } catch {
                //Handle the error
                print("erorr can't play file")
            }
        }
        else {
            self.slider.doubleValue -= 1/(60 * 60)
            self.progress.progress -= 1/(60 * 60)
            
            if (seconds == 0) {
                seconds = 59
            }
            else {
                seconds -= 1
            }
        }
        
        self.lblMinutes.stringValue = String(format: "%02d", Int(self.progress.progress * 60))
        self.lblSeconds.stringValue = String(format: "%02d", seconds)
    }
}


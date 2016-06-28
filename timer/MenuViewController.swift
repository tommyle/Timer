//
//  MenuViewController.swift
//  timer
//
//  Created by Tommy Le on 2016-05-03.
//  Copyright © 2016 Tommy Le. All rights reserved.
//

import Cocoa
import ProgressKit
import AVFoundation

class MenuViewController: NSViewController {

    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var progress: CircularProgressView!
    @IBOutlet weak var lblMinutes: NSTextField!
    @IBOutlet weak var lblSeconds: NSTextField!
    @IBOutlet weak var btnList: NSButton!
    
    weak var timer = NSTimer?()
    var seconds: Int = 0
    var audioPlayer:AVAudioPlayer!
    var appDelegate:AppDelegate!
    
    var label1: NSTextField!
    var label2: NSTextField!
    var timerView: TimerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        /*
        self.slider.alphaValue = 0.0
        //        self.slider.layer?.backgroundColor = NSColor.greenColor().CGColor
        self.slider.continuous = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        
        self.slider.doubleValue = 1.0
        self.progress.progress = 1.0
        
        self.progress.setValue(Helper.NSColorFromRGB(0x323338), forKey: "background")
        self.progress.setValue(8, forKey: "strokeWidth")
        self.progress.setValue(false, forKey: "showPercent")
        self.progress.setValue(Helper.NSColorFromRGB(0x3BB3D4), forKey: "foreground")
        self.progress.setValue(1.0, forKey: "progress")
        */
        
        self.timerView = TimerView(frame: CGRectMake(0, 0, 200, 200));
        self.view.addSubview(self.timerView);
        
        self.timerView.slider.action = #selector(sliderValueChanged);
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func sliderValueChanged(sender : NSSlider) {
        let x: Double = sender.doubleValue
        progress.progress = CGFloat(x)
        seconds = -1
        
        self.lblMinutes.stringValue = String(format: "%02d", Int(self.progress.progress * 60))
        self.lblSeconds.stringValue = String(format: "%02d", 0)
        
        self.appDelegate.statusItem.title = String(format: "🕕 %02d:%02d", Int(self.progress.progress * 60), 0)
        
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
            
            let notification = NSUserNotification.init()
            notification.title = "Timer Message"
            notification.informativeText = "The timer has ended!"
            notification.soundName = NSUserNotificationDefaultSoundName
            NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification)
        }
        else {
            self.slider.doubleValue -= 1/(60 * 60)
            self.progress.progress -= 1/(60 * 60)
            
            //-1 means the user just set the time via the dial so we need to decrement a whole minute
            if (seconds == -1) {
                self.slider.doubleValue -= 60/(60 * 60)
                self.progress.progress -= 60/(60 * 60)
            }

            if (seconds <= 0) {
                seconds = 59
            }
            else {
                seconds -= 1
            }
        }
        
        self.lblMinutes.stringValue = String(format: "%02d", Int(self.progress.progress * 60))
        self.lblSeconds.stringValue = String(format: "%02d", seconds)
        
        self.appDelegate.statusItem.title = String(format: "🕕 %02d:%02d", Int(self.progress.progress * 60), seconds)
    }
    
    @IBAction func buttonClick(sender : NSButton) {
//        label2 = NSTextField(frame: CGRectMake(0, 0, 200, 21));
//        label2.stringValue = "GoodByeWorld";

//        listView = NSView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height));
        
//        timerView = TimerView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height));
//
//        self.view.animator().replaceSubview(self.view, with: timerView);
        
//        let slideInFromLeftTransition = CATransition()
//
//        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
//            context.duration = 1;
//            view.animator.alphaValue = 0;
//            }
//            completionHandler:^{
//            view.hidden = YES;
//            view.alphaValue = 1;
//            }];
//        
//        NSAnimation
//        NSAnimationContext.currentContext().completionHandler = {
//            self.view.frame.origin.x = self.view.frame.size.width;
//
//        }
//        
//        NSAnimationContext.runAnimationGroup({ (context) -> Void in
//            context.duration = 1.0
//            self.view.frame.origin.x = self.view.frame.size.width + 15;
//            }, completionHandler: nil
//        )
    }
}

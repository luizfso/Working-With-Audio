//
//  ViewController.swift
//  Working With Audio
//
//  Created by Luiz Fernando Santiago on 10/25/15.
//  Copyright © 2015 Luiz Fernando Santiago. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet weak var scrubSlider: UISlider!
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
        print(scrubSlider.value)
    }
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    
    func updateScrubSlider(){
    
        scrubSlider.value = Float(player.currentTime)
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
        } catch{
            print("Error")
        }
        
    }
    
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            
             scrubSlider.maximumValue = Float(player.duration)
            
        } catch{
            
            print("Error")
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


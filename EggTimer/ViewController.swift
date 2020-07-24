//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 8, "Hard": 12 ]
    var totalTime = 0
    var secondsRemaining = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBAction func eggButton(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        barProgress.progress = 0
        secondsRemaining = 0
        
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining < totalTime {
            secondsRemaining += 1
            let percentProgress = Float(secondsRemaining) / Float(totalTime)
            barProgress.progress = percentProgress
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

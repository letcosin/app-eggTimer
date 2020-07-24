//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 8, "Hard": 12 ]
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBAction func eggButton(_ sender: UIButton) {
        timer.invalidate()
        barProgress.progress = 1.0
        let hardness = sender.currentTitle!
        secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}

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
    
    @IBAction func eggButton(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        countdown(qtdEgg: eggTime[hardness]!)
    }
    
    func countdown(qtdEgg: Int){
        let minutes = qtdEgg * 60
        var secondsRemaining = minutes
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            secondsRemaining = secondsRemaining - 1
            print(secondsRemaining)
          }
    }
}

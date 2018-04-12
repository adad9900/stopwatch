//
//  ViewController.swift
//  stopwatch
//
//  Created by D7703_16 on 2018. 4. 12..
//  Copyright © 2018년 201412402. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTrimer = Timer()

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format :  "%02d:%02d:%02d", min, sec, msec)
    }

    @IBAction func start(_ sender: Any) {
        myTrimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
        changeButtonState(startS : false, stopS : true, resetS : true)
    }
    
    @IBAction func stop(_ sender: Any) {
        myTrimer.invalidate()
        changeButtonState(startS : true, stopS : false, resetS : true)
    }
    
    @IBAction func reset(_ sender: Any) {
        myTrimer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
        changeButtonState(startS : true, stopS : true, resetS : false)
        
    }
    
    func changeButtonState(startS : Bool, stopS : Bool, resetS : Bool) {
        start.isEnabled = startS
        stop.isEnabled = stopS
        reset.isEnabled = resetS
    }

}


//
//  ViewController.swift
//  Countdown App
//
//  Created by Cody on 7/22/19.
//  Copyright © 2019 Cody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var seconds = 30
    var Start = true
    var countup = 1
    
    var timer = Timer()
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelProcedure: UILabel!
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        
        seconds = Int(sender.value)
        labelTime.text = String(seconds)
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    
    @IBAction func startButton(_ sender: Any) {
    
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        
    }
    
    @objc func counter(){
        
        //add another variable except make it equal to seconds * -1 and update that
        //label after htting '0'
        
        if (seconds != 0){
            if (Start){
                labelProcedure.text = "Countdown Started"
                Start = false
            }
            
            if (seconds == 15){
                labelProcedure.text = "Turn Launch and \nIgnitor Safety off"
            }
        
            if (seconds == 3){
                labelProcedure.text = "Ignition!"
            }
        
            seconds -= 1
            labelTime.text = String(seconds)
        }
        
        else {
            labelTime.text = "+ " + String(countup)
            countup += 1
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
    
        timer.invalidate()
        seconds = 30
        countup = 1
        sliderOutlet.setValue(30, animated: true)
        labelTime.text = "30"
        labelProcedure.text = "SDSU RP"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


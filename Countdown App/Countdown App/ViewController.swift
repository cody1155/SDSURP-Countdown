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
    
    var timer = Timer()
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelProcedure: UILabel!
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        
        positiveSeconds = Int(sender.value)
        labelTime.text = String(positiveSeconds)
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    
    @IBAction func startButton(_ sender: Any) {
    
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        
    }
    
    @objc func counter(){
        if (seconds == 20){
            labelProcedure.text = "Countdown Started"
            
        }
        
        seconds -= 1
        labelTime.text = String(seconds)
        
        
        if (seconds == 15){
            labelProcedure.text = "Turn Launch and \nIgnitor Safety off"
            
        }
        
        if (seconds == 2){
            labelProcedure.text = "Ignition!"
            
        }
        
        
        if (seconds == 0)
        {
            labelTime.text = String(0)
            //timer.invalidate()
            
            
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            
        }
    
    }
    
    @IBAction func reset(_ sender: Any) {
    
        timer.invalidate()
        seconds = 30
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


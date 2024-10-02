//
//  ViewController.swift
//  santaClicker
//
//  Created by Suchay Seelam on 12/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var gameController = Game();
    var timer : Timer = Timer()
    
    @IBOutlet weak var presentLabel: UILabel!
    var displayPresent : String{
        return String(gameController.getPresents());
    }
    enum timeState{
        case on
        case off
    }
    var timerState = timeState.off
    var totalMultiplier : Int = 1;
    
    //Timer and Auto Variables
    
    @IBOutlet weak var santaButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presentLabel.text = displayPresent;
        if timerState == timeState.off{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
            timerState = timeState.on
        }
    }
    @IBAction func unwindToGame(unwindsegue: UIStoryboardSegue){
        
    }

    @IBAction func santaPress(_ sender: UIButton) {
        gameController.press();
        presentLabel.text = displayPresent;
    }
   

    @objc func everySecond(){
        presentLabel.text = displayPresent;
    }
    
    
    
}


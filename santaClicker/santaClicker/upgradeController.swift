//
//  upgradeController.swift
//  santaClicker
//
//  Created by Suchay Seelam on 12/6/23.
//
import Foundation
import UIKit
class upgradeController : UIViewController, UIGestureRecognizerDelegate
{
    
    
    
    var gameController = Game();
    
    @IBOutlet var ownedLabels: [UILabel]!
    
    var timer : Timer = Timer();
    enum timeState{
        case on
        case off
    }
    var state = timeState.off;
    @IBOutlet weak var presentLabel: UILabel!
    
    var presentDisplay : String{
        return "Presents Owned: \(gameController.getPresents())";
    }
    //Upgrade Structs
     var autoClicker : autoclicker = autoclicker( multiplier: 1, auto: true, tag: 0);
     var Elves : elves = elves( multiplier: 2, auto: false, tag: 1);
     var Reindeers : reindeer = reindeer( multiplier: 3, auto: false, tag: 2);
     var Sleighs : sleigh = sleigh( multiplier: 5, auto: false, tag: 3);
     var presentMines : presentMine = presentMine( multiplier: 5, auto: true, tag: 4);
     var presentFactorys : presentFactory = presentFactory( multiplier: 10, auto: true,  tag: 5);
     var northPoles : northPole = northPole( multiplier: 10, auto: false, tag: 6);
     var presentReactors : presentReactor = presentReactor( multiplier: 20, auto: true, tag: 7);

    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        presentLabel.text = presentDisplay;
        if state == timeState.off{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
            gameController.startTimer()

            state = timeState.on;
        }
        ownedLabels[0].text = "Owned: \(String(autoClicker.getAmount()))"
        ownedLabels[1].text = "Owned: \(String(Elves.getAmount()))"
        ownedLabels[2].text = "Owned: \(String(Reindeers.getAmount()))"
        ownedLabels[3].text = "Owned: \(String(Sleighs.getAmount()))"
        ownedLabels[4].text = "Owned: \(String(presentMines.getAmount()))"
        ownedLabels[5].text = "Owned: \(String(presentFactorys.getAmount()))"
        ownedLabels[6].text = "Owned: \(String(northPoles.getAmount()))"
        ownedLabels[7].text = "Owned: \(String(presentReactors.getAmount()))"

    }
    
    @IBAction func buyUpgrade(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            if gameController.getPresents() >= autoclicker.cost{
                gameController.purchase(cost: autoclicker.cost)
                autoClicker.purchase();
                ownedLabels[0].text = "Owned: \(String(autoClicker.getAmount()))"
                presentLabel.text = presentDisplay;
                if state == timeState.off{
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
                    gameController.startTimer()

                    state = timeState.on;
                }
                gameController.increaseAutoMultiplier(autoClicker.multiplier);
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "An auto-clicker costs \(autoclicker.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 1:
            if gameController.getPresents() >= elves.cost{
                gameController.purchase(cost: elves.cost)
                Elves.purchase();
                ownedLabels[1].text = "Owned: \(String(Elves.getAmount()))"
                gameController.changeMultiplier(Elves.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "An elf costs \(elves.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 2:
            if gameController.getPresents() >= reindeer.cost{
                gameController.purchase(cost: reindeer.cost)
                Reindeers.purchase();
                ownedLabels[2].text = "Owned: \(String(Reindeers.getAmount()))"
                gameController.changeMultiplier(Reindeers.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A Reindeer costs \(reindeer.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 3:
            if gameController.getPresents() >= sleigh.cost{
                gameController.purchase(cost: sleigh.cost)
                Sleighs.purchase();
                ownedLabels[3].text = "Owned: \(String(Sleighs.getAmount()))"
                gameController.changeMultiplier(Sleighs.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A Sleigh costs \(sleigh.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 4:
            if gameController.getPresents() >= presentMine.cost{
                gameController.purchase(cost: sleigh.cost)
                presentMines.purchase();
                ownedLabels[4].text = "Owned: \(String(presentMines.getAmount()))"
                if state == timeState.off{
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
                    gameController.startTimer()

                    state = timeState.on;
                }
                gameController.increaseAutoMultiplier(presentMines.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A Present Mine costs \(presentMine.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 5:
            if gameController.getPresents() >= presentFactory.cost{
                gameController.purchase(cost: presentFactory.cost)
                presentFactorys.purchase();
                ownedLabels[5].text = "Owned: \(String(presentFactorys.getAmount()))"
                if state == timeState.off{
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
                    gameController.startTimer()

                    state = timeState.on;
                }
                gameController.increaseAutoMultiplier(presentFactorys.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A Present Factory costs \(presentFactory.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        case 6:
            if gameController.getPresents() >= northPole.cost{
                gameController.purchase(cost: northPole.cost)
                northPoles.purchase();
                ownedLabels[6].text = "Owned: \(String(northPoles.getAmount()))"
                gameController.changeMultiplier(northPoles.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A North Pole costs \(northPole.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
            return
        default:
            if gameController.getPresents() >= presentReactor.cost{
                gameController.purchase(cost: presentReactor.cost)
                presentReactors.purchase();
                ownedLabels[7].text = "Owned: \(String(presentReactors.getAmount()))"
                if state == timeState.off{
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
                    gameController.startTimer()

                    state = timeState.on;
                }
                gameController.increaseAutoMultiplier(presentReactors.multiplier);
                presentLabel.text = presentDisplay;
            }else{
                let alert = UIAlertController(title: "Insufficient Presents", message: "A Present Reactor costs \(presentReactor.cost) presents", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in return}))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    @objc func everySecond(){
        presentLabel.text = presentDisplay;
        //print("1")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.viewDidLoad();
        
    }

    
}
extension upgradeController{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

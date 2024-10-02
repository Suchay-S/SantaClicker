//
//  Game.swift
//  santaClicker
//
//  Created by Suchay Seelam on 12/6/23.
//

import Foundation
import UIKit
class Game{
    static var presentsAmount : Int = 0;
    static var totalMultiplier : Int = 1;
    static var autoMultiplier : Int = 0;
    var timer : Timer = Timer();
    public enum timerState{
        case on
        case off
    }
    public static var timeState = timerState.off
    public func presentsToString()->String{
        return String(Game.presentsAmount);
    }
    
    public func getPresents() -> Int{
        return Game.presentsAmount;
    }
    
    public func getMultiplier() -> Int{
        return Game.totalMultiplier;
    }
    
    public func changeMultiplier(_ newMultipler : Int){
        Game.totalMultiplier += newMultipler;
    }
    
    public func increaseAutoMultiplier(_ amount : Int){
        Game.autoMultiplier += amount;
    }
    public func press(){
        Game.presentsAmount += Game.totalMultiplier;
    }
    
    public func purchase(cost : Int){
        Game.presentsAmount -= cost;
    }
    public func startTimer(){
        if Game.timeState == timerState.off{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true);
            Game.timeState = timerState.on;

        }
    }
    @objc func everySecond(){
        Game.presentsAmount += Game.autoMultiplier;
    }
    
}

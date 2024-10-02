//
//  Upgrade.swift
//  santaClicker
//
//  Created by Suchay Seelam on 12/6/23.
//

import Foundation


class Upgrade{
    var multiplier : Int;
    var auto : Bool;
    var tag : Int;
    init(multiplier : Int, auto : Bool, tag : Int){
        self.multiplier = multiplier;
        self.auto = auto;
        self.tag = tag;
    }
    public func calculateCost() -> Int{
        switch tag{
        case 0:
            return 0;
        default:
            return 0;
        }
    }
}
class autoclicker : Upgrade{
    static var amountOwned : Int = 0
    static var cost = 10;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        autoclicker.amountOwned += 1;
        if autoclicker.amountOwned % 2 == 0
        {
            autoclicker.cost = Int(Double(autoclicker.cost) * 1.5);
        }
    }
    public func getAmount() -> Int{
        return autoclicker.amountOwned;
    }
}
class elves : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 1000;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        elves.amountOwned += 1;
        if elves.amountOwned % 3 == 0{
            elves.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return elves.amountOwned;
    }
}
class reindeer : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 10000;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        reindeer.amountOwned += 1;
        if reindeer.amountOwned % 3 == 0{
            reindeer.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return reindeer.amountOwned;
    }
}
class sleigh : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 100000;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        sleigh.amountOwned += 1;
        if sleigh.amountOwned % 5 == 0{
            sleigh.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return sleigh.amountOwned;
    }
}
class presentMine : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 10000;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        presentMine.amountOwned += 1;
        if presentMine.amountOwned % 3 == 0{
            presentMine.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return presentMine.amountOwned;
    }
}
class presentFactory : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 100000;
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        presentFactory.amountOwned += 1;
        if presentFactory.amountOwned % 5 == 0{
            presentFactory.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return presentFactory.amountOwned;
    }
}
class northPole : Upgrade{
    static var amountOwned : Int = 0
    static var cost = 1000000
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        northPole.amountOwned += 1;
        if northPole.amountOwned % 7 == 0{
            northPole.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return northPole.amountOwned;
    }
}
class presentReactor : Upgrade{
    static var amountOwned : Int = 0
    static var cost : Int = 1000000
    override init(multiplier: Int, auto: Bool, tag: Int) {
        super.init(multiplier: multiplier, auto: auto, tag: tag)
    }
    public func purchase(){
        presentReactor.amountOwned += 1;
        if presentReactor.amountOwned & 7 == 0{
            presentReactor.cost *= 2;
        }
    }
    public func getAmount() -> Int{
        return presentReactor.amountOwned;
    }
}

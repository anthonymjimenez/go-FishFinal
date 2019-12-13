//
//  Player.swift
//
//


import Foundation

class Player : GenericPlayer{
    // goldmine
    var bank: Bank
   private var yields = false
   private var canBet = false
    
    init(hand: Hand, bank: Bank) {
        self.bank = bank
        super.init(hand: hand)
    }
    
    func setYielding(yields: Bool){
        self.yields = yields
    }
    
    func isYeilding()-> Bool{
        return yields
    }
    
    func setCanBet(canBet: Bool){
        self.canBet = canBet
    }
    
    func getCanBet()-> Bool{
        return canBet
    }
}

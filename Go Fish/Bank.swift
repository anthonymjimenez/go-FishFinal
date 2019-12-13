//
//  Bank.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//

//
//  Bank.swift
//  goFish
// holds balance and betLimit to limit user to betting 100 per turn


import Foundation

class Bank {
    var balance = 200
    var betLimit = 100
    
    init() {
        
   }
    // reset when balance = 0
    func resetBalance(){
        
       balance = 500
    }
    // limit reset after every turn
    func resetLimit() {
        betLimit = 100
    }
    func addMoney(amount: Int){ // Bank.addMoney(moneyAmount)
        balance += amount
    }
    
    func subtractMoney(amount: Int){
        balance -= amount
       
    }
    func subtractLimit(amount: Int) {
        betLimit -= amount
    }
    func limitCheck()->Bool{
        if(betLimit < 0){
            return true
        }
        else {
            return false
        }
    }
    
    func getBalance()->Int{
        return balance
    }
  }

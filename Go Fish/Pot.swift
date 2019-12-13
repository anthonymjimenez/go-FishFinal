//
//  Pot.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//

import Foundation


class Pot {
    private var pot = 0
        // pot.addMoney(amount: betAmount.rawValue)
    func addMoney(amount: Int){
        pot += amount
    }
    
    func getMoney()->Int{ // get method
        return pot
    }
    
    func reset(){
        pot = 0
    }

    
}

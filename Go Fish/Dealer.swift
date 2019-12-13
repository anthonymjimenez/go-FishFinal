//
//  Dealer.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//


import Foundation


class Dealer: GenericPlayer{
   private var firstCard = Card(suit: "card_front",value: 0)
    private var secondCard = Card(suit: "card_front", value: 0)
    
    override init(hand: Hand) {
       super.init(hand: hand)
    }
    
    func setFirstCard(card: Card){
        firstCard = card
    }
    func setSecondCard(card: Card){
        secondCard = card
    }
    
    func getFirstCard()->Card{
        return firstCard
    }
    func getSecondCard()->Card {
        return secondCard
    }}

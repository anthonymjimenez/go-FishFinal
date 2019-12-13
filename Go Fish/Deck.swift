//
//  Deck.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//

import Foundation

// revisit

class Deck {
    private var deck = [Card]()
    private var deckIndex = -1
    // deck index starts at -1 to allow the deckIndex increment to work
    init() {
       create()
    }
    
    func create(){ // creates an entire deck of cards
        let suits = ["d","h","s","c"]
        for cardSuit in suits { // looping thru our suit array
            for cardValue in 1...9 { // possible values for a card in a deck
              let tempCard = Card(suit: cardSuit, value: cardValue)
                deck.append(tempCard) // this appends to ARRAY
            }
        }
    }
    
    
    func getTopCard()->Card{
        deckIndex += 1
        return deck[deckIndex]
    }
    
    func shuffle(){ // Use the shuffle() method to randomly reorder the elements of an array
        deck.shuffle()
    }
    
    func new(){
        deckIndex = -1
        shuffle()
    }
    func getLength()->Int {
        return deck.count
    }
    
    
 
}

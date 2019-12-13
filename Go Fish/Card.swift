//
//  Card.swift
//  goFish
// using in conjuction with hand.swift
// a hand is an array of cards
// getValue() used to determine value when checking for 4 of a kind

import Foundation
import SpriteKit


class Card:SKSpriteNode {
   private var suit:String = ""
   private var value:Int = 0
    init(suit: String, value: Int) {
        self.suit = suit
        self.value = value
        let texture = SKTexture(imageNamed: suit + String(value))
        // this determines which card is played & displayed on screen suit plus value ex. Jack + 4 , Queen + 10
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    func getValue()->Int{
        return value
    }
    func getSuite()->String {
        return suit
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}

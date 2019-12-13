//
//  Money.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//





import Foundation
import SpriteKit

class Money:SKSpriteNode {
    // money and moneyValue are used to create the chips in our game scene
    // and subtract the one of 3 possible money values
    private var moneyValue = MoneyValue.ten
    init(moneyValue: MoneyValue) {
        var texture:SKTexture
        self.moneyValue = moneyValue
        switch moneyValue {
        case .ten:
            texture = SKTexture(imageNamed: "money10")
        case .twentyFive:
            texture = SKTexture(imageNamed: "money25")
        case .fifty:
            texture = SKTexture(imageNamed: "money50")
        }
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "money"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getValue()->MoneyValue{
        return moneyValue
    }


}

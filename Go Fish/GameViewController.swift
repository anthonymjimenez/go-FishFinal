//
//  GameViewController.swift
//  Go Fish
//
//  Created by Anthony Jimenez on 12/12/19.
//  Copyright © 2019 Stacey Carrillo&Anthony Jimenez. All rights reserved.
//
 

import UIKit
import SpriteKit
 
class GameViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let scene = GameScene(size:CGSize(width: 768, height: 1024))
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
     
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

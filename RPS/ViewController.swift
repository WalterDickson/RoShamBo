//
//  ViewController.swift
//  RPS
//
//  Created by Asante Dickson on 6/20/17.
//  Copyright © 2017 Zinpool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var roShamBo: UILabel!
    @IBOutlet weak var ro: UIButton!
    @IBOutlet weak var sham: UIButton!
    @IBOutlet weak var bo: UIButton!
    @IBOutlet weak var playAgain: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        update(forGameState: .start)
    }
    
    @IBAction func rock(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func paper(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func scissors(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func playButton(_ sender: UIButton) {
        update(forGameState: .start)
    }
    
    // Function that determines the state of the game
    func play(_ playerSign: Sign) {
        let opponentSign = randomSign()
        let gameState = playerSign.gameState(versusSign: opponentSign)
        update(forGameState: gameState)
        appSign.text = opponentSign.emoji
        ro.isEnabled = false
        ro.isHidden = true
        sham.isEnabled = false
        sham.isHidden = true
        bo.isEnabled = false
        bo.isHidden = true
        
        switch playerSign {
        case .rock:
            ro.isHidden = false
        case .paper:
            sham.isHidden = false
        case .scissors:
            bo.isHidden = false
        }
        playAgain.isHidden = false
    }
    
    // Update the view (.start, .win, .lose, .draw)
    func update(forGameState gameState: GameState) {
        
        roShamBo.text = gameState.status
        switch gameState {
        case .start:
            view.backgroundColor = UIColor.lightGray
            appSign.text = "👾"
            ro.isEnabled = true
            ro.isHidden = false
            sham.isEnabled = true
            sham.isHidden = false
            bo.isEnabled = true
            bo.isHidden = false
            playAgain.isHidden = true
        case .win:
            view.backgroundColor = UIColor.green
        case .lose:
            view.backgroundColor = UIColor.blue
        case .draw:
            view.backgroundColor = UIColor.brown
        }
    }
}

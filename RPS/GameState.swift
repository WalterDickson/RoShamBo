//
//  GameState.swift
//  RPS
//
//  Created by Asante Dickson on 6/22/17.
//  Copyright © 2017 Zinpool. All rights reserved.
//

// An enum for the current status/state of the game
enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "It's a Draw!"
        }
    }
}

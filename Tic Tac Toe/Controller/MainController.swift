//
//  MenuView.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//
import UIKit
import Foundation
extension MainViewController {
    @objc func startGame(_ sender: UIButton) {
        let game: Game
        
        let players = [Computer(sign: .X,name: "Computer"), Human(sign: .O,name: "\(username.text!)")].shuffled()
        game = Game(player1: players[0], player2: players[1])
        
        
        let gameVC = GameViewController(game: game)
        
        present(gameVC, animated: true, completion: nil)
    }
}

//
//  GameController.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//
import UIKit
import Foundation
extension GameViewController {

       
       @objc func update(_ sender: Any) {
           updateUI()
       }
       
       func updateUI() {
           DispatchQueue.main.async {
               // Update infos label
               if self.game.current != .empty {
                   // Get the player object
                   var current: Player?
                   for player in [self.game.player1, self.game.player2] {
                       if player.sign == self.game.current {
                           current = player
                       }
                   }
                   
                   // Differentiate human and computer in text
                   if current as? Computer != nil {
                       self.infos.text = "Computer's Turn"
                   } else {
                       if(current?.user != nil){
                           self.infos.text = current!.user + "'s Turn"}
                   }
                   self.again.isHidden = true
                   self.back.isHidden = true
               } else {
                   // Game has ended
                   let win = self.game.win(table: self.game.table)
                   var current: Player?
                   for player in [self.game.player1, self.game.player2] {
                       if player.sign == win {
                           current = player
                       }
                   }
                   
                   // Differentiate human and computer in text
                   if current as? Computer != nil {
                       self.infos.text = "Computer has won!"
                   } else if current as? Human != nil {
                       if(current?.user != nil){
                       self.infos.text = current!.user + " has won!" }
                   } else {
                       self.infos.text = "Game ended as a draw!"
                   }
                   self.again.isHidden = false
                   self.back.isHidden = false
               }
               
               // Update images
               let boxes = [[self.box1, self.box4, self.box7], [self.box2, self.box5, self.box8], [self.box3, self.box6, self.box9]]
               
               for x in 0 ..< 3 {
                   for y in 0 ..< 3 {
                       let box = boxes[x][y]
                       let sign = self.game.table[x][y]
                       
                       if sign != .empty {
                           box.image = UIImage(named: sign == .X ? "o" : "x")
                       } else {
                           box.image = nil
                       }
                   }
               }
           }
       }
       
       @objc func clickOnImage(_ sender: UITapGestureRecognizer) {
           // Iterate the players
           for player in [game.player1, game.player2] {
               // Check if it's a human, and the current player
               if let human = player as? Human, game.current == human.sign, let img = sender.view as? UIImageView {
                   // Determine the location
                   let x = img.tag % 3
                   let y = img.tag / 3
                   
                   // Play!
                   DispatchQueue.global(qos: .background).async {
                       human.completion?(x, y)
                   }
               }
           }
       }
       
       @objc func again(_ sender: UIButton) {
           // Create a new game with same players
           self.game = Game(player1: game.player1, player2: game.player2)
           updateUI()
           
           // And start it
           DispatchQueue.global(qos: .background).async {
               self.game.nextMove()
           }
       }
       
       @objc func back(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }
}

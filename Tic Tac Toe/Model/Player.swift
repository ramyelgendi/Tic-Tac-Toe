//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//

import Foundation
class Player {
    
    var user = "Player"
    
    var sign: Sign
    init(sign: Sign,name: String) {
        self.sign = sign
        if(name != ""){
            user = name
        }
    }
    
    
    func play(game: Game, completion: @escaping (Int, Int) -> ()) {
        completion(0, 0)
    }
    
}

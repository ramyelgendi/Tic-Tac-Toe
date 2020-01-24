//
//  Human.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//

import Foundation
class Human: Player {
    
    var completion: ((Int, Int) -> ())?
    
    override func play(game: Game, completion: @escaping (Int, Int) -> ()) {
        self.completion = completion
    }
    
}


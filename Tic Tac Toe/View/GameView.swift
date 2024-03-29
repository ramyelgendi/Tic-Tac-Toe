//
//  GameViewController.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//

import UIKit
class GameViewController: UIViewController {
    
    var game: Game
    let box1 = UIImageView()
    let box2 = UIImageView()
    let box3 = UIImageView()
    let box4 = UIImageView()
    let box5 = UIImageView()
    let box6 = UIImageView()
    let box7 = UIImageView()
    let box8 = UIImageView()
    let box9 = UIImageView()
    let infos = UILabel()
    let again = UIButton()
    let back = UIButton()
    
    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register for notifications
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: .update, object: nil)
        
        // Init colors
        view.backgroundColor = UIColor.white
        for box in [box1, box2, box3, box4, box5, box6, box7, box8, box9] {
                   box.layer.borderWidth = 1
                   box.layer.borderColor = UIColor.black.cgColor
        }
        infos.textColor = UIColor.black
        
        // Add elements to view
        view.addSubview(box1)
        view.addSubview(box2)
        view.addSubview(box3)
        view.addSubview(box4)
        view.addSubview(box5)
        view.addSubview(box6)
        view.addSubview(box7)
        view.addSubview(box8)
        view.addSubview(box9)
        view.addSubview(infos)
        view.addSubview(again)
        view.addSubview(back)
        
        // Setup box 1
        box1.translatesAutoresizingMaskIntoConstraints = false
        box1.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box1.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box1.rightAnchor.constraint(equalTo: box2.leftAnchor).isActive = true
        box1.bottomAnchor.constraint(equalTo: box4.topAnchor).isActive = true
        
        box1.tag = 0
        box1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box1.isUserInteractionEnabled = true
        
        // Setup box 2
        box2.translatesAutoresizingMaskIntoConstraints = false
        box2.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box2.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box2.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        box2.bottomAnchor.constraint(equalTo: box5.topAnchor).isActive = true
        
        box2.tag = 1
        box2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box2.isUserInteractionEnabled = true
        
        // Setup box 3
        box3.translatesAutoresizingMaskIntoConstraints = false
        box3.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box3.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box3.leftAnchor.constraint(equalTo: box2.rightAnchor).isActive = true
        box3.bottomAnchor.constraint(equalTo: box6.topAnchor).isActive = true
        
        box3.tag = 2
        box3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box3.isUserInteractionEnabled = true
        
        // Setup box 4
        box4.translatesAutoresizingMaskIntoConstraints = false
        box4.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box4.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box4.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: -20).isActive = true
        box4.rightAnchor.constraint(equalTo: box5.leftAnchor).isActive = true
        
        box4.tag = 3
        box4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box4.isUserInteractionEnabled = true
        
        // Setup box 5
        box5.translatesAutoresizingMaskIntoConstraints = false
        box5.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box5.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box5.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        box5.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: -20).isActive = true
        
        box5.tag = 4
        box5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box5.isUserInteractionEnabled = true
        
        // Setup box 6
        box6.translatesAutoresizingMaskIntoConstraints = false
        box6.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box6.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box6.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: -20).isActive = true
        box6.leftAnchor.constraint(equalTo: box5.rightAnchor).isActive = true
        
        box6.tag = 5
        box6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box6.isUserInteractionEnabled = true
        
        // Setup box 7
        box7.translatesAutoresizingMaskIntoConstraints = false
        box7.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box7.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box7.rightAnchor.constraint(equalTo: box8.leftAnchor).isActive = true
        box7.topAnchor.constraint(equalTo: box4.bottomAnchor).isActive = true
        
        box7.tag = 6
        box7.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box7.isUserInteractionEnabled = true
        
        // Setup box 8
        box8.translatesAutoresizingMaskIntoConstraints = false
        box8.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box8.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box8.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        box8.topAnchor.constraint(equalTo: box5.bottomAnchor).isActive = true
        
        box8.tag = 7
        box8.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box8.isUserInteractionEnabled = true
        
        // Setup box 9
        box9.translatesAutoresizingMaskIntoConstraints = false
        box9.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box9.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1/3).isActive = true
        box9.leftAnchor.constraint(equalTo: box8.rightAnchor).isActive = true
        box9.topAnchor.constraint(equalTo: box6.bottomAnchor).isActive = true
        
        box9.tag = 8
        box9.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickOnImage(_:))))
        box9.isUserInteractionEnabled = true
        
        // Setup infos
        infos.translatesAutoresizingMaskIntoConstraints = false
        infos.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        infos.bottomAnchor.constraint(equalTo: box2.topAnchor, constant: -30).isActive = true
        
        infos.font = UIFont.boldSystemFont(ofSize: 26)
        infos.numberOfLines = 2
        infos.textAlignment = .center
        infos.adjustsFontSizeToFitWidth = true
        
        // Setup again
        again.translatesAutoresizingMaskIntoConstraints = false
        again.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        again.topAnchor.constraint(equalTo: box8.bottomAnchor, constant: 30).isActive = true
        again.widthAnchor.constraint(equalToConstant: 300).isActive = true
        again.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        again.layer.cornerRadius = 4
        again.clipsToBounds = true
        
        again.setTitle("Play Again", for: .normal)
        again.setTitleColor(.white, for: .normal)
        again.backgroundColor = UIColor.black
        again.addTarget(self, action: #selector(again(_:)), for: .touchUpInside)
        
        // Setup back
        back.translatesAutoresizingMaskIntoConstraints = false
        back.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        back.topAnchor.constraint(equalTo: again.bottomAnchor, constant: 20).isActive = true
        back.widthAnchor.constraint(equalToConstant: 300).isActive = true
        back.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        back.layer.cornerRadius = 4
        back.clipsToBounds = true
        
        back.setTitle("Go Back", for: .normal)
        back.setTitleColor(.white, for: .normal)
        back.backgroundColor = UIColor.black
        back.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        
        // Load the empty grid
        updateUI()
        
        // Everything is up, start the game
        DispatchQueue.global(qos: .background).async {
            self.game.nextMove()
        }
    }
    
   deinit {
             NotificationCenter.default.removeObserver(self, name: .update, object: nil)    }
    
    
    
}

//
//  MainViewController.swift
//  Tic Tac Toe
//
//  Created by Ramy ElGendi on 1/23/20.
//  Copyright © 2020 Ramy ElGendi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    let menu = UIView()
    let name = UILabel()
    let subname = UILabel()
    let button_play = UIButton()
    let bottom = UILabel()
    let pic = UIImageView()
    let username = UITextField()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.white

        view.addSubview(menu)
        view.addSubview(name)
        view.addSubview(subname)
        view.addSubview(button_play)
        view.addSubview(bottom)
        view.addSubview(pic)
        view.addSubview(username)

        
        // Username
       username.translatesAutoresizingMaskIntoConstraints = false
//       username.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor).isActive = true
       username.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        username.borderStyle = .roundedRect;
        username.placeholder = "Username here"
        username.frame.size.height = 10
        username.backgroundColor = UIColor.lightText
        username.textColor = UIColor.black
       username.topAnchor.constraint(equalTo: subname.bottomAnchor, constant: 20).isActive = true

        // Picture
        pic.image = UIImage(named: "logo")
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor).isActive = true
        pic.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor).isActive = true
        pic.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        pic.topAnchor.constraint(equalTo: menu.topAnchor).isActive = true

        // Setup menu
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        menu.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
        
        // Setup name
        name.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: pic.bottomAnchor, constant: 20).isActive = true
        name.centerXAnchor.constraint(equalTo: menu.centerXAnchor).isActive = true
        name.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        name.text = "Tic Tac Toe"
        name.font = UIFont.boldSystemFont(ofSize: 48)
        name.adjustsFontSizeToFitWidth = true
        name.textAlignment = .center
        
        // Setup subname
        subname.translatesAutoresizingMaskIntoConstraints = false
        
        subname.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        subname.centerXAnchor.constraint(equalTo: menu.centerXAnchor).isActive = true
        subname.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        subname.text = "Assignment 5\nCSCE4930 - Mobile Apps"
        subname.numberOfLines = 0
        subname.textAlignment = .center
        
       
        // Setup 2nd button
        button_play.translatesAutoresizingMaskIntoConstraints = false
        
        button_play.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20).isActive = true
        button_play.centerXAnchor.constraint(equalTo: menu.centerXAnchor).isActive = true
        button_play.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button_play.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button_play.layer.cornerRadius = 4
        button_play.clipsToBounds = true
        
        button_play.setTitle("Play", for: .normal)
        button_play.setTitleColor(.white, for: .normal)
        button_play.backgroundColor = UIColor.black
        button_play.addTarget(self, action: #selector(startGame(_:)), for: .touchUpInside)
        
        
        // Setup the bottom text
        bottom.translatesAutoresizingMaskIntoConstraints = false
        
        bottom.topAnchor.constraint(equalTo: button_play.bottomAnchor, constant: 40).isActive = true
        bottom.centerXAnchor.constraint(equalTo: menu.centerXAnchor).isActive = true
        bottom.bottomAnchor.constraint(equalTo: menu.bottomAnchor).isActive = true
        bottom.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        bottom.text = "Developed By: \nRamy ElGendi\n900170269"
        bottom.numberOfLines = 0
        bottom.textAlignment = .center
    }

}

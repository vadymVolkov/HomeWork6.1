//
//  DetailsController.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var surnameLabel: UILabel!
        @IBOutlet weak var emailLabel: UILabel!
        @IBOutlet weak var passwordLabel: UILabel!
        @IBOutlet weak var cityLabel: UILabel!
        @IBOutlet weak var telephoneLabel: UILabel!
        @IBOutlet weak var aboutLabel: UILabel!
        
        var name: String?
        var surname: String?
        var email: String?
        var password: String?
        var city: String?
        var telephone: String?
        var about: String?
        override func viewDidLoad() {
            super.viewDidLoad()
            
            nameLabel.text = name
            surnameLabel.text = surname
            emailLabel.text = email
            passwordLabel.text = password
            cityLabel.text = city
            telephoneLabel.text = telephone
            aboutLabel.text = about
        }
        
       
    


}

//
//  TextViewCell.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.layer.borderWidth = 1
        
      
    }
}

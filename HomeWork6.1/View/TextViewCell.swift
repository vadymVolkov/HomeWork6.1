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
    @IBOutlet weak var textViewBottomOffset: NSLayoutConstraint!
    
    let keyboardBottomOffset: CGFloat = 20
    
    var currentTextField: UITextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.layer.borderWidth = 1
        
        
        
        

        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
      
    }

  

    @objc func keyboardWillShow(_ notification: Notification) {
        if currentTextField == textView {
            if let userInfo = notification.userInfo {
                if let keyboardFrame = userInfo["UIKeyboardFrameEndUserInfoKey"] as? CGRect, let duration = userInfo["UIKeyboardAnimationDurationUserInfoKey"] as? TimeInterval {
                    textViewBottomOffset.constant = keyboardBottomOffset + keyboardFrame.height
                    
                    UIView.animate(withDuration: duration) {
                        self.textView.setNeedsLayout()
                        self.textView.layoutIfNeeded()
                    }
                }
            }
        }
    }

}

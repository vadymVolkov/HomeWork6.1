//
//  ViewController.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewOffset: NSLayoutConstraint!
    
    let keyboardBottomOffset: CGFloat = 20
    
    //var currentTextField: UITextView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        
        
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrame = userInfo["UIKeyboardFrameEndUserInfoKey"] as? CGRect, let duration = userInfo["UIKeyboardAnimationDurationUserInfoKey"] as? TimeInterval {
                tableViewOffset.constant = keyboardBottomOffset + keyboardFrame.height
                UIView.animate(withDuration: duration) {
                    self.view.setNeedsLayout()
                    self.view.layoutIfNeeded()
                }
            }
        }
        
    }
    
    
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(identifier: "Details Controller") as DetailsController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Storage.fieldCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = Storage.item(at: indexPath.item)
        let cell = tableView.dequeueReusableCell(withIdentifier: item.fieldType.rawValue, for: indexPath)
        cell.textLabel?.text = item.fieldName
        cell.tag = indexPath.item
        for view in cell.contentView.subviews {
            if let textField = view as? UITextField {
                let index = indexPath.row
                textField.text = item.content
                textField.tag = index
                textField.delegate = self
                textField.isSecureTextEntry = item.isSecured
                textField.placeholder = item.placeholder
                
            }
            if let textView = view as? UITextView {
                let index = indexPath.row
                textView.text = item.content
                textView.tag = index
                textView.delegate = self
                
            }
            
        }
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = Storage.item(at: indexPath.item)
        return item.rowHight
    }
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let prevString = textField.text!
        let swiftRange = Range(range, in: prevString)!
        
        let newString = prevString.replacingCharacters(in: swiftRange, with: string)
        
        let index = textField.tag
        
        
        
        Storage.setContent(at: index, content: newString)
        
        
        
        return true
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let prevString = textView.text!
        let swiftRange = Range(range, in: prevString)!
        
        let newString = prevString.replacingCharacters(in: swiftRange, with: text)
        let index = textView.tag
        Storage.setContent(at: index, content: newString)
        
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let index = textView.tag
        let indexPath = IndexPath(row: index, section: 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
 
    
}

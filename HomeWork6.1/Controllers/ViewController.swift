//
//  ViewController.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = Storage.item(at: indexPath.item)
        return item.rowHight
    }
}

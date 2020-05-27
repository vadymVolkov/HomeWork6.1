//
//  Field.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//

import UIKit

struct Field {
    let fieldName: String
    let isSecured: Bool
    let rowHight: CGFloat
    let placeholder: String
    enum FieldType: String {
       case textField = "Text Field"
       case textView = "Text View"
       case label = "Label"
       case button = "Button"
    }
    let fieldType: FieldType
}

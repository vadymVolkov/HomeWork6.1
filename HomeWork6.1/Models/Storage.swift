//
//  Storage.swift
//  HomeWork6.1
//
//  Created by Vadym Volkov on 27.05.2020.
//  Copyright © 2020 Vadym Volkov. All rights reserved.
//


struct Storage {
    private static var fieldList = [
        Field(fieldName: "Имя", isSecured: false, rowHight: 44, placeholder: "Name", fieldType: .textField),
        Field(fieldName: "Фамилия", isSecured: false, rowHight: 44, placeholder: "Surname", fieldType: .textField),
        Field(fieldName: "Email", isSecured: false, rowHight: 44, placeholder: "Email", fieldType: .textField),
        Field(fieldName: "Пароль", isSecured: true, rowHight: 44, placeholder: "Password", fieldType: .textField),
        Field(fieldName: "Город", isSecured: false, rowHight: 44, placeholder: "City", fieldType: .textField),
        Field(fieldName: "Телефон", isSecured: false, rowHight: 44, placeholder: "Telephone", fieldType: .textField),
        Field(fieldName: "О себе", isSecured: false, rowHight: 130, placeholder: "About me", fieldType: .textView),
        Field(fieldName: "Политика конфиденциальности", isSecured: false, rowHight: 44, placeholder: " ", fieldType: .label),
        Field(fieldName: " ", isSecured: false, rowHight: 44, placeholder: "Отправить", fieldType: .button)
    ]
    static var fieldCount: Int {
        return fieldList.count
    }
    static func item(at index: Int) -> Field {
        return fieldList[index]
    }
    static func setContent(at index: Int, content: String) {
        fieldList[index].content = content
    }
}

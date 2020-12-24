//
//  String+extensions.swift
//  ToDoApp
//
//  Created by Лера Тарасенко on 24.12.2020.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "!@#$%^&*()-=[]+\\{},.<>?").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}

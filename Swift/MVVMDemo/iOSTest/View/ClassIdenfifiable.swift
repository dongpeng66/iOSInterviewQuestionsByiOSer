//
//  ClassIdenfifiable.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/25.
//

import Foundation

protocol ClassIdenfifiable {
    static var reuseIdentifier: String { get }
}

extension ClassIdenfifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}



//
//  SelfConfiguringCell.swift
//  Walkie
//
//  Created by Артем Гаршин on 01.12.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}


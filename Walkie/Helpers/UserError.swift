//
//  UserError.swift
//  Walkie
//


import Foundation


enum UserError{
    case notFilled
    case photoNotExist
    case cannotUnwrapToMUser
    case cannotGetUserInfo
}


extension UserError: LocalizedError{
    var errorDescription: String?{
        switch self{
            
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Невозможно загрузить информацию о пользователе", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Невозможно конвертировать Muser в User", comment: "")
        }
    }
}

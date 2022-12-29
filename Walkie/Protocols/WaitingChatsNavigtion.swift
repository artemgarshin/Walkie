//
//  WaitingChatsNavigtion.swift
//  Walkie
//


import Foundation


protocol WaitingChatsNavigation: class{
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}

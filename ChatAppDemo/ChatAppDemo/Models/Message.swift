//
//  Message.swift
//  ChatAppDemo
//
//  Created by Bilegt Davaa on 2022-02-25.
//

import Foundation

struct Message : Identifiable, Codable{
    var id : String
    var text: String
    var received: Bool
    var timestap: Date
}

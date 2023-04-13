//
//  User.swift
//  NewsApp
//
//  Created by саргашкаева on 20.07.2022.
//

import Foundation

struct User: Codable {
    var name: String
    var id: Int
    var username: String
    var phone: String
    var website: String
    var company: Company
}

struct Company: Codable {
    var name: String 
}


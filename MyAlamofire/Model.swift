//
//  Model.swift
//  MyAlamofire
//
//  Created by 박힘찬 on 2022/03/25.
//

import SwiftUI

struct RandomUserResponse: Codable {
    var results: [User]
    var info : Info
}

struct User: Codable, Hashable {
    var name : Name
    var picture: Picture
}

struct Name: Codable, Hashable {
    var title: String
    var first: String
    var last: String
}

struct Picture: Codable, Hashable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct Info: Codable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

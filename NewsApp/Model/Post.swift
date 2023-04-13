//
//  Post.swift
//  NewsApp
//
//  Created by саргашкаева on 20.07.2022.
//

import Foundation


struct Articles: Codable { 
    var articles: [Post] = []
}

struct Post: Codable  {
    var description: String?
    var title: String?
    let urlToImage: String?
}







//
//  PostViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 21.07.2022.
//

import Foundation
import UIKit

protocol PostViewModelProtocol {
    var articlesModel: Articles {get set}
    func getData(completion: @escaping ()->())
}

class PostViewModel: PostViewModelProtocol {
    
    var articlesModel = Articles()
    private var networkManager = NetworkManager()
    
    func getData(completion: @escaping ()->()) {
        guard let postURL =  URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=39dc9dc6a2204f258237b8506623850e") else {
            print("Invalid URL")
            return }
        let postRequest = URLRequest(url: postURL)
        networkManager.decodePostsData(ofType: Articles.self, urlRequest: postRequest) { [weak self] data in
            self?.articlesModel = data
            completion()
        }
    }
}
    
   
    
    




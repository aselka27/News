//
//  CommentsViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 22.07.2022.
//

import Foundation

protocol CommentsViewModelProtocol {
    var commentModel: [Comments?] {get}
    var postId: Int {get set}
    
    func getData(completion: @escaping ()->())
}

class CommentsViewModel: CommentsViewModelProtocol {

    private(set) var commentModel: [Comments?] = []
    var postId: Int = 0
    private var networkManager = NetworkManager()
    
    func getData(completion: @escaping ()->()) {
        guard let commentsURL =  URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
                
        else {
            print("Invalid URL")
            return
        }
        let commentsRequest = URLRequest(url: commentsURL)
        networkManager.decodeUsersData(ofType: Comments.self, urlRequest: commentsRequest) { [weak self] data in
            self?.commentModel = data
            completion()
        }
        
    }
}


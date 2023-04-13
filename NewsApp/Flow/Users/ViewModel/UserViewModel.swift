//
//  UserViewModel.swift
//  NewsApp
//
//  Created by саргашкаева on 24.07.2022.
//

import Foundation

protocol UserViewModelProtocol {
    var userModel: [User?] { get }
    func getData(completion: @escaping ()->())
  
}

class UserViewModel: UserViewModelProtocol {
    private(set) var userModel: [User?] = []
    private var networkManager = NetworkManager()
  
    
    func getData(completion: @escaping ()->()) {
        guard let userInfoURL =  URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            return}
        let userInfoRequest = URLRequest(url: userInfoURL)
        networkManager.decodeUsersData(ofType: User.self, urlRequest: userInfoRequest) { [weak self] data in
            self?.userModel = data
            completion()
        }
    }
}

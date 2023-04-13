//
//  NetworkManager.swift
//  NewsApp
//
//  Created by саргашкаева on 21.07.2022.
//

import Foundation

struct NetworkManager {
    
    func getRequest (urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error occured")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
    
    func decodeUsersData<T: Codable> (ofType: T.Type, urlRequest: URLRequest, response: @escaping ([T])->Void) {
        getRequest(urlRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    response(decodedData)
                } catch let jsonError{
                    print("Parsing error", jsonError)
                }
            case .failure(let error):
                print("Error has occured\(error.localizedDescription)")
            }
        }
    }
    func decodePostsData<T: Codable> (ofType: T.Type, urlRequest: URLRequest, response: @escaping (T)->Void) {
        getRequest(urlRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    response(decodedData)
                } catch let jsonError{
                    print("Parsing error", jsonError)
                }
            case .failure(let error):
                print("Error has occured\(error.localizedDescription)")
            }
        }
    }
}

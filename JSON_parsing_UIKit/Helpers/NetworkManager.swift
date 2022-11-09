//
//  NetworkManager.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 09.11.2022.
//

import Alamofire

class NetworkManager {
    
    static private let jsonUrlList = "https://rickandmortyapi.com/api/character"
    
    
    static func fetchData(completion: @escaping ([Character]) -> ()){
        guard let url = URL(string: jsonUrlList) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(CharactersList.self, from: data)
                let characters = json.results
                
                DispatchQueue.main.async {
                    completion(characters ?? [])
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    static func fetchDataAlamofire(completion: @escaping ([Character]) -> ()){
        
        AF
            .request(jsonUrlList)
            .validate()
            .responseDecodable(of: CharactersList.self){ response in

            switch response.result {
            case .success(let value):
                let characters = value.results
                
                DispatchQueue.main.async {
                    completion(characters ?? [])
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

//
//  ListTableViewController.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 07.11.2022.
//

import UIKit
import Alamofire

class ListTableViewController: UITableViewController {
    
    let jsonUrlList = "https://rickandmortyapi.com/api/character"
    
    var characters: [Character] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func fetchData(){
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
                self.characters = json.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataAlamofire(){
        
        guard let url = URL(string: jsonUrlList) else { return }
        
        AF.request(url).validate().responseDecodable(of: CharactersList.self){ response in

            switch response.result {
            case .success(let value):
                self.characters = value.results

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

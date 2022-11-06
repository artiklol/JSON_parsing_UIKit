//
//  ListTableViewController.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 07.11.2022.
//

import UIKit

class ListTableViewController: UITableViewController {

    let jsonUrlList = "https://rickandmortyapi.com/api/character"

    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        
        let character = characters[indexPath.row]
        cell.configure(with: character)

        return cell
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
                let websiteDescription = try JSONDecoder().decode(CharactersList.self, from: data)
                self.characters = websiteDescription.results
                print(self.characters)
            } catch let error {
                print(error)
            }
        }.resume()
    }

}

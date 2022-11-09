//
//  ListTableViewController.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 07.11.2022.
//

import UIKit
import Alamofire

class ListTableViewController: UITableViewController {
    
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
    
}

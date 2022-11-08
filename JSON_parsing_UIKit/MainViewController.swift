//
//  MainViewController.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 05.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var letsGoButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listTVC = segue.destination as! ListTableViewController
        
        switch segue.identifier {
        case "urlsession":
            listTVC.fetchData()
        case "alamofire":
            listTVC.fetchDataAlamofire()
        default:
            break
        }
    }
    
}

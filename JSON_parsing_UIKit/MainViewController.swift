//
//  MainViewController.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 05.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var letsGoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonStyle(button: letsGoButton)
    }
    
    
    func setupButtonStyle(button : UIButton){
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 28/255, green: 161/255, blue: 73/255, alpha: 1).cgColor
    }
    
}

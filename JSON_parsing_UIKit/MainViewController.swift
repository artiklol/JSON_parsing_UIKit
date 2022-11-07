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
    }
    
}

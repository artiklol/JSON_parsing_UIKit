//
//  CharacterCell.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 07.11.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var nameCharacter: UILabel!
    @IBOutlet var statusCharacter: UILabel!
    @IBOutlet var speciesCharacter: UILabel!
    @IBOutlet var genderCharacter: UILabel!
    @IBOutlet var imageCharacter: UIImageView!
    
    func configure(with character: Character) {
        nameCharacter.text = character.name
        statusCharacter.text = character.status
        speciesCharacter.text = character.species
        genderCharacter.text = character.gender

        DispatchQueue.global().async {
            guard let imageUrl = URL(string: character.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.imageCharacter.image = UIImage(data: imageData)
            }
        }
        
        imageCharacter.layer.cornerRadius = imageCharacter.frame.height / 2
        imageCharacter.clipsToBounds = true
        imageCharacter.layer.masksToBounds = true
    }
    
}


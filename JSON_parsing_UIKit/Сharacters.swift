//
//  Сharacters.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 06.11.2022.
//

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let image: String
}

struct CharacterArray: Decodable{
    let results: [Character]
}

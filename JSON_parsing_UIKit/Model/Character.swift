//
//  Character.swift
//  JSON_parsing_UIKit
//
//  Created by Artem Sulzhenko on 07.11.2022.
//

struct CharactersList: Decodable{
    let results: [Character]?
}

struct Character: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
}

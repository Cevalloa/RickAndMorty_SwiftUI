//
//  Untitled.swift
//  RickAndMorty_SwiftUI
//
//  Created by Alex Cevallos on 8/8/26.
//

struct CharacterResponse: Decodable {
    let info: CharacterInfoResponse
}

struct CharacterInfoResponse: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

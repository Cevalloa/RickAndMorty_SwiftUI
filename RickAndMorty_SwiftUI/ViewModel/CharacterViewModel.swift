//
//  CharacterViewModel.swift
//  RickAndMorty_SwiftUI
//
//  Created by Alex Cevallos on 8/8/26.
//
import SwiftUI

@MainActor
@Observable
class CharacterViewModel {
    
    // MARK: - Service Layer
    private let characterService = CharacterService()
    
    // MARK: - Class Level Properties
    
    var info: CharacterInfoResponse?
    var characters: [Character] = []

    func getCharacters() async {
        let characterResponse = await characterService.fetchCharacters()
        info = characterResponse?.info
        if let newCharacters = characterResponse?.results {
            characters.append(contentsOf: newCharacters)
        }
    }

    func getAdditionalCharacters() async {
        let charactersArrived = await characterService.fetchCharacters()

        if let newCharacters = charactersArrived?.results {
            characters.append(contentsOf: newCharacters)
        }
    }
}

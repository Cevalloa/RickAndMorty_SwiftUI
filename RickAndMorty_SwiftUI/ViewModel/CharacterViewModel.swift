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
    private let characterService = CharacterService()
    var characterResponse: CharacterResponse?
    var characters: [Character] = []

    func getCharacters() async {
        characterResponse = await characterService.fetchCharacters()
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

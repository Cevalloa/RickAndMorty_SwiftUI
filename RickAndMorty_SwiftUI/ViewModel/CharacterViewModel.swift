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
    var characters: CharacterResponse?
    
    func getCharacters() async {
        characters = await characterService.fetchCharacters()
    }
}

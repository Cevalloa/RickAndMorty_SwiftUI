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
    
    func getCharacters() async {
        characterResponse = await characterService.fetchCharacters()
    }
}

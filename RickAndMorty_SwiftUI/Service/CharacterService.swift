//
//  CharacterService.swift
//  RickAndMorty_SwiftUI
//
//  Created by Alex Cevallos on 8/8/26.
//

import SwiftUI

struct CharacterService {
    func fetchCharacters() async -> CharacterResponse? {
        guard let url = URL(string:"https://rickandmortyapi.com/api/character") else {
            return nil
        }

        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
            return characterResponse
        } catch {
            print(error)
        }
        
        return nil
    }
}

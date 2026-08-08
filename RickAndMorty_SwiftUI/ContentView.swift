//
//  ContentView.swift
//  RickAndMorty_SwiftUI
//
//  Created by Alex Cevallos on 8/8/26.
//

import SwiftUI

struct ContentView: View {
    @State var characterViewModel = CharacterViewModel()
    var body: some View {
        
        Group {
            if let response = characterViewModel.characterResponse {
                List(response.results.indices, id:\.self) { index in
                    let character = response.results[index]
                    Text(character.name)
                }
            }
        }.task {
            await characterViewModel.getCharacters()
        }
    }
}

#Preview {
    ContentView()
}

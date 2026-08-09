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
            if !characterViewModel.characters.isEmpty {
                List(characterViewModel.characters.indices, id:\.self) { index in
                    let character = characterViewModel.characters[index]
                    Text(character.name).task {
                        
                        if index == characterViewModel.characters.count - 1 {
                            await characterViewModel.getAdditionalCharacters()
                        }
                    }
                }
            } else {
                ContentUnavailableView("Unable to fetch data", systemImage: "tray")
            }
        }.task {
            await characterViewModel.getCharacters()
        }
    }
}

#Preview {
    ContentView()
}

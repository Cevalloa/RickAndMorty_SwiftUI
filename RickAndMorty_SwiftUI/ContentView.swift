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
                    Text(character.name).onAppear {
                        
                        if index == response.results.count - 1 {
                            print("End of the line")
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

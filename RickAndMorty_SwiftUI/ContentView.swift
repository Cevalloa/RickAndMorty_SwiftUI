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
        List() {
            Text("\(characterViewModel.characters?.info.count ?? 0)")
        }.task {
            await characterViewModel.getCharacters()
        }
    }
}

#Preview {
    ContentView()
}

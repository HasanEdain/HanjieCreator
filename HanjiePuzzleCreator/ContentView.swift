//
//  ContentView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    @State var puzzle: Puzzle = Puzzle()

    var body: some View {
        GenerateView(puzzle: $puzzle)
    }
}

#Preview {
    ContentView()
}

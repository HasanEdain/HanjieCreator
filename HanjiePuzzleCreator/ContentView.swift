//
//  ContentView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PuzzleView(puzzle: Puzzle())
    }
}

#Preview {
    ContentView()
}

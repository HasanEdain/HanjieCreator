//
//  HanjiePuzzleCreatorApp.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/20/24.
//

import SwiftUI

@main
struct HanjiePuzzleCreatorApp: App {
    @StateObject var puzzle: Puzzle = Puzzle()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(puzzle)
        }
    }
}

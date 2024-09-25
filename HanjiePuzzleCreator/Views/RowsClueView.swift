//
//  RowsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct RowsClueView: View {
    @EnvironmentObject var puzzle: Puzzle

    var body: some View {
        horizontalClues()
    }

    @ViewBuilder func horizontalClues() -> some View {
        VStack (spacing: 0){
            ForEach(puzzle.puzzleTiles.tileLines.indices, id: \.self) { xIndex in
                HorizontalClueView(rowNumber: xIndex)
            }
        }.border(.blue)
    }
}

#Preview {
    let fourDotPuzzle =  ExamplePuzzles.fourDots
    let letterXPuzzle =  ExamplePuzzles.letterX
    let framedPuzzle =  ExamplePuzzles.framed
    let crosshairPuzzle =  ExamplePuzzles.crosshair
    let dash =  ExamplePuzzles.dash

    VStack {
        RowsClueView()
            .environmentObject(fourDotPuzzle)
        RowsClueView()
            .environmentObject(letterXPuzzle)
        RowsClueView()
            .environmentObject(framedPuzzle)
        RowsClueView()
            .environmentObject(crosshairPuzzle)
        RowsClueView()
            .environmentObject(dash)
    }
}


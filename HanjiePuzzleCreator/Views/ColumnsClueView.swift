//
//  ColumnsClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct ColumnsClueView: View {
    @EnvironmentObject var puzzle: Puzzle

    var body: some View {
        HStack (spacing: 0){
            ForEach(puzzle.puzzleTiles.tileLines.indices, id: \.self) { yIndex in
                VerticalClueView(columnNumber: yIndex)
                    .frame(height: puzzle.column(number: yIndex).stringSize(tileSize: puzzle.tileSize))
            }
        }.border(.blue)
    }
}

#Preview {
    let fourDotPuzzle = ExamplePuzzles.fourDots
    let letterXPuzzle =  ExamplePuzzles.letterX
    let framedPuzzle =  ExamplePuzzles.framed
    let crosshair =  ExamplePuzzles.crosshair
    let dash =  ExamplePuzzles.dash

    VStack {
        ColumnsClueView()
            .environmentObject(fourDotPuzzle)
            .padding()
        ColumnsClueView()
            .environmentObject(letterXPuzzle)
            .padding()
        ColumnsClueView()
            .environmentObject(framedPuzzle)
            .padding()
        ColumnsClueView()
            .environmentObject(crosshair)
            .padding()
        ColumnsClueView()
            .environmentObject(dash)
            .padding()
    }

}

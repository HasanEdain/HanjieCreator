//
//  EmptyPuzzleView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/24/24.
//

import SwiftUI

struct EmptyPuzzleView: View {
    @EnvironmentObject var puzzle: Puzzle

    var body: some View {

        VStack (spacing: 0.0) {
            ForEach(puzzle.puzzleTiles.tileLines.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach(puzzle.puzzleTiles.tileLines[yIndex].tiles.indices, id: \.self) { xIndex in
                        EmptyTileView()
                    }
                }
            }
        }.frame(width: puzzle.tileSize*CGFloat(puzzle.width), height: puzzle.tileSize*CGFloat(puzzle.height), alignment: .center)

    }
}

#Preview {
    let puzzle = Puzzle()
    let frame =  ExamplePuzzles.framed
    let four =  ExamplePuzzles.fourDots
    let x =  ExamplePuzzles.letterX
    let crosshair =  ExamplePuzzles.crosshair

    VStack {
        EmptyPuzzleView()
            .environmentObject(puzzle)
            .padding()
        EmptyPuzzleView()
            .environmentObject(frame)
            .padding()
        EmptyPuzzleView()
            .environmentObject(four)
            .padding()
        EmptyPuzzleView()
            .environmentObject(x)
            .padding()
        EmptyPuzzleView()
            .environmentObject(crosshair)
            .padding()
    }

}

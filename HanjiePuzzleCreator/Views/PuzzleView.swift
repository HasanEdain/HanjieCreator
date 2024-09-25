    //
    //  PuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/23/24.
    //

import SwiftUI

struct PuzzleView: View {
    @EnvironmentObject var puzzle: Puzzle

    var body: some View {
        
        VStack (spacing: 0.0) {
            ForEach($puzzle.puzzleTiles.tileLines.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach(puzzle.puzzleTiles.tileLines[yIndex].tiles.indices, id: \.self) { xIndex in
                        TileView(location: Location(x: xIndex, y: yIndex))
                    }
                }
            }
        }.frame(width: puzzle.tileSize*CGFloat(puzzle.width),
                height: puzzle.tileSize*CGFloat(puzzle.height),
                alignment: .center)
    }
}

#Preview {
    let puzzle = Puzzle()
    let frame =  ExamplePuzzles.framed
    let four =  ExamplePuzzles.fourDots
    let x =  ExamplePuzzles.letterX
    let crosshair =  ExamplePuzzles.crosshair

    VStack {
        PuzzleView()
            .environmentObject(puzzle)
            .padding()
        PuzzleView()
            .environmentObject(crosshair)
            .padding()
        PuzzleView()
            .environmentObject(frame)
            .padding()
        PuzzleView()
            .environmentObject(four)
            .padding()
        PuzzleView()
            .environmentObject(x)
            .padding()
    }

}

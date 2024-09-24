    //
    //  PuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/23/24.
    //

import SwiftUI

struct PuzzleView: View {
    @ObservedObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 14
    
    var body: some View {
        
        VStack (spacing: 0.0) {
            ForEach(puzzle.tiles.indices, id: \.self) { yIndex in
                HStack (spacing: 0.0) {
                    ForEach(puzzle.tiles[yIndex].indices, id: \.self) { xIndex in
                        TileView(tile: puzzle.tiles[yIndex][xIndex], size: tileSize)
                    }
                }
            }
        }.frame(width: tileSize*CGFloat(puzzle.width), height: tileSize*CGFloat(puzzle.height), alignment: .center)
        
    }
}


#Preview {
    let puzzle = Puzzle()
    let frame = Puzzle.framed
    let four = Puzzle.fourDots
    let x = Puzzle.letterX

    VStack {
        PuzzleView(puzzle: puzzle).padding()
        PuzzleView(puzzle: frame).padding()
        PuzzleView(puzzle: four).padding()
        PuzzleView(puzzle: x).padding()
    }

}

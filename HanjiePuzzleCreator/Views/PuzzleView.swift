    //
    //  PuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/23/24.
    //

import SwiftUI

struct PuzzleView: View {
    @StateObject var puzzle: Puzzle
    @State var tileSize: CGFloat = 14

    var body: some View {
        VStack {
            Text("\(puzzle.name)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            HStack{
                RowsClueView(puzzle: puzzle)
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
            ColumnsClueView(puzzle: puzzle)
        }
    }
}


#Preview {
    let puzzle = Puzzle()

    PuzzleView(puzzle: puzzle)
}

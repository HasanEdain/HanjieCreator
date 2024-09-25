    //
    //  PrintablePuzzleView.swift
    //  HanjiePuzzleCreator
    //
    //  Created by Hasan Edain on 9/24/24.
    //

import SwiftUI

struct PrintablePuzzleView: View {
    @Binding var showHints: Bool
    @Binding var puzzle: Puzzle
    @Binding var tileSize: CGFloat
    var isEmpty: Bool = false

    var body: some View {

            VStack (alignment: .trailing,spacing: 0)  {
                      Text("\(puzzle.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: (CGFloat(puzzle.width)+1.35) * puzzle.tileSize)
                 HStack (spacing: 0){
                    if showHints {
                        RowsClueView(puzzle: $puzzle)
                    }
                     if isEmpty {
                         EmptyPuzzleView(puzzle: $puzzle)
                     } else {
                         PuzzleView(puzzle: $puzzle, tileSize: $tileSize)
                     }
                }
                if showHints {
                    ColumnsClueView(puzzle: $puzzle)
                }
            }
        }

}

#Preview {
    @Previewable @State var show:Bool = true
    @Previewable @State var puzzle = Puzzle.fourDots
    @Previewable @State var tileSize: CGFloat = 16.0

    PrintablePuzzleView(showHints: $show, puzzle: $puzzle, tileSize: $tileSize)
    PrintablePuzzleView(showHints: $show, puzzle: $puzzle, tileSize: $tileSize,isEmpty: true)
}

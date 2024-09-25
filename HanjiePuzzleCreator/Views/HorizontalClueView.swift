//
//  HorizontalClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct HorizontalClueView: View {
    @EnvironmentObject var puzzle: Puzzle

    let rowNumber: Int

    var body: some View {
        Text("\(tileLine.horizontalString)")
            .frame(height: size, alignment: .center)
    }

    var tileLine: TileLine {
        return puzzle.row(number: rowNumber)
    }

    var  size: CGFloat {
        return puzzle.tileSize
    }

}

#Preview {
    VStack {
        HorizontalClueView(rowNumber: 0)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 1)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 2)
            .environmentObject(ExamplePuzzles.letterX)
            .padding()
        HorizontalClueView(rowNumber: 3)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 4)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 5)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 6)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 7)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 8)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
        HorizontalClueView(rowNumber: 8)
            .environmentObject(ExamplePuzzles.letterX)
            .border(.red)
            .padding()
    }
}

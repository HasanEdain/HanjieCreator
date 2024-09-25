//
//  VerticalClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct VerticalClueView: View {
    let columnNumber: Int
    @EnvironmentObject var puzzle: Puzzle

    var body: some View {
        Text("\(tileLine.verticalString)")
            .foregroundStyle(.white)
            .frame(width: size, height: tileLine.stringSize(tileSize: size),alignment: .center)
    }

    var tileLine: TileLine {
        return puzzle.column(number: columnNumber)
    }

    var size: CGFloat {
        return puzzle.tileSize
    }

}

#Preview {
    VStack {
        VerticalClueView(columnNumber: 0)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 1)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 2)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 3)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 4)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 5)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 6)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 7)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 8)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()
        VerticalClueView(columnNumber: 9)
            .environmentObject(ExamplePuzzles.crosshair)
            .border(.red)
            .padding()

    }

}

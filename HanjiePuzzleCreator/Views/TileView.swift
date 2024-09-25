//
//  TileView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct TileView: View {
    @EnvironmentObject var puzzle:Puzzle

    let location: Location

    var body: some View {
        Rectangle()
            .foregroundColor(tile.tileColor.color)
            .frame(width: puzzle.tileSize, height: puzzle.tileSize)
            .border(.black)
            .onTapGesture {
                tile.toggle()
            }
    }

    var tile: Tile {
        puzzle.tile(at: location)
    }
}

#Preview {
    let locationOne = Location(x: 0, y: 0)
    let locationTwo = Location(x: 1, y: 0)
    let locationThree = Location(x: 2, y: 0)
    let locationFour = Location(x: 3, y: 0)
    let locationFive = Location(x: 4, y: 0)
    let locationSix = Location(x: 5, y: 0)
    let locationSeven = Location(x: 6, y: 0)
    let locationEight = Location(x: 7, y: 0)
    let locationNine = Location(x: 8, y: 0)
    let locationTen = Location(x: 9, y: 0)

    VStack {
        TileView(location: locationOne)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationTwo)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationThree)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationFour)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationFive)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationSix)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationSeven)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationEight)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationNine)
            .environmentObject( ExamplePuzzles.rainbow)
        TileView(location: locationTen)
            .environmentObject( ExamplePuzzles.rainbow)
    }.padding()

}

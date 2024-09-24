//
//  VerticalClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct VerticalClueView: View {
    @ObservedObject var tileLine: TileLine
    @State var size: CGFloat
    var body: some View {
        Text("\(tileLine.verticalSting)")
            .frame(width: size, height: tileLine.stringSize(tileSize: size), alignment: .center)
            .border(.white)
    }
}

#Preview {
    let size: CGFloat = 14.0
    let lineOne = TileLine(tiles: [Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
    let lineTwo = TileLine(tiles: [Tile(),
                                   Tile(tileColor: TileColor.primary),
                                   Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
    let lineThree = TileLine(tiles: [Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
    let lineFour = TileLine(tiles: [Tile(),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
    let lineFive = TileLine(tiles: [Tile(),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(),Tile(),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(tileColor: TileColor.primary),
                                    Tile(),Tile(),Tile()])
    let lineSix = TileLine(tiles: [Tile(),
                                   Tile(tileColor: TileColor.primary),
                                   Tile(),
                                   Tile(tileColor: TileColor.primary),
                                   Tile(),
                                   Tile(tileColor: TileColor.primary),
                                   Tile(),Tile(),Tile(),Tile()])
    let lineSeven = TileLine(tiles: [Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile()])
    let lineEight = TileLine(tiles: [Tile(tileColor: TileColor.primary),
                                     Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(tileColor: TileColor.primary),
                                     Tile(),
                                     Tile(tileColor: TileColor.primary)])

    VStack {
        VerticalClueView(tileLine: lineOne, size: size)
            .padding()
        VerticalClueView(tileLine: lineTwo, size: size)
            .padding()
        VerticalClueView(tileLine: lineThree, size: size)
            .padding()
        VerticalClueView(tileLine: lineFour, size: size)
            .padding()
        VerticalClueView(tileLine: lineFive, size: size)
            .padding()
        VerticalClueView(tileLine: lineSix, size: size)
            .padding()
        VerticalClueView(tileLine: lineSeven, size: size)
            .padding()
        VerticalClueView(tileLine: lineEight, size: size)
            .padding()
    }

}

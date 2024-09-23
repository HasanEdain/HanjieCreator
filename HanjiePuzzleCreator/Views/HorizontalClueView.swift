//
//  HorizontalClueView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct HorizontalClueView: View {
    @ObservedObject var tileLine: TileLine
    @State var size: CGFloat

    var body: some View {
        Text("\(tileLine.horizontalString)").frame(width: tileLine.stringSize(tileSize: size), height: size, alignment: .center)
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
        HorizontalClueView(tileLine: lineOne, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineTwo, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineThree, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineFour, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineFive, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineSix, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineSeven, size: size)
            .border(.red)
            .padding()
        HorizontalClueView(tileLine: lineEight, size: size)
            .border(.red)
            .padding()
    }
}

//
//  TileView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct TileView: View {
    @ObservedObject var tile: Tile
    @State var size: CGFloat

    var body: some View {
        Rectangle()
            .foregroundColor(tile.tileColor.color)
            .frame(width: size, height: size)
            .border(.black)
            .onTapGesture {
                tile.toggle()
            }
    }
}

#Preview {
    let emptyTile = Tile(tileColor: .empty)
    let primaryTile = Tile(tileColor: .primary)
    let secondaryTile = Tile(tileColor: .second)
    let tertiaryTile = Tile(tileColor: .third)
    let fourthTile = Tile(tileColor: .fourth)
    let fifthTile = Tile(tileColor: .fifth)
    let sixthTile = Tile(tileColor: .sixth)
    let seventhTile = Tile(tileColor: .seventh)
    let eigthTile = Tile(tileColor: .eighth)
    let ninthTile = Tile(tileColor: .ninth)

    let tilesize: CGFloat = 16.0

    VStack {
        TileView(tile: emptyTile, size: tilesize)
        TileView(tile: primaryTile, size: tilesize)
        TileView(tile: secondaryTile, size: tilesize)
        TileView(tile: tertiaryTile, size: tilesize)
        TileView(tile: fourthTile, size: tilesize)
        TileView(tile: fifthTile, size: tilesize)
        TileView(tile: sixthTile, size: tilesize)
        TileView(tile: seventhTile, size: tilesize)
        TileView(tile: eigthTile, size: tilesize)
        TileView(tile: ninthTile, size: tilesize)
    }.padding()

}

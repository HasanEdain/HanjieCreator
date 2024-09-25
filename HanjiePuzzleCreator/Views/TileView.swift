//
//  TileView.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import SwiftUI

struct TileView: View {
    @Binding var tile: Tile
    @Binding var size: CGFloat

    var body: some View {
        Rectangle()
            .foregroundStyle(tile.tileColor.color)
            .frame(width: size, height: size)
            .border(.black)
            .onTapGesture {
                tile.toggle()
            }
    }
}

#Preview {
    @Previewable @State var emptyTile = Tile(tileColor: .empty)
    @Previewable @State var primaryTile = Tile(tileColor: .primary)
    @Previewable @State var secondaryTile = Tile(tileColor: .second)
    @Previewable @State var tertiaryTile = Tile(tileColor: .third)
    @Previewable @State var fourthTile = Tile(tileColor: .fourth)
    @Previewable @State var fifthTile = Tile(tileColor: .fifth)
    @Previewable @State var sixthTile = Tile(tileColor: .sixth)
    @Previewable @State var seventhTile = Tile(tileColor: .seventh)
    @Previewable @State var eigthTile = Tile(tileColor: .eighth)
    @Previewable @State var ninthTile = Tile(tileColor: .ninth)

    @Previewable @State var tilesize: CGFloat = 16.0

    VStack {
        TileView(tile: $emptyTile, size: $tilesize)
        TileView(tile: $primaryTile, size: $tilesize)
        TileView(tile: $secondaryTile, size: $tilesize)
        TileView(tile: $tertiaryTile, size: $tilesize)
        TileView(tile: $fourthTile, size: $tilesize)
        TileView(tile: $fifthTile, size: $tilesize)
        TileView(tile: $sixthTile, size: $tilesize)
        TileView(tile: $seventhTile, size: $tilesize)
        TileView(tile: $eigthTile, size: $tilesize)
        TileView(tile: $ninthTile, size: $tilesize)
    }.padding()

}

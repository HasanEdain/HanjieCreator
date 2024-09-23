//
//  TileLineTest.swift
//  HanjiePuzzleCreatorTests
//
//  Created by Hasan Edain on 9/23/24.
//

import Testing

@testable import HanjiePuzzleCreator

struct TileLineTest {
/*
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
    */

    @Test func testCountArrayEmpty() async throws {
        let lineOne = TileLine(tiles: [Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
        let array = lineOne.countArray
        #expect(array.counts.isEmpty)
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func testCountArrayOneOne() async throws {
        let lineTwo = TileLine(tiles: [Tile(),
                                       Tile(tileColor: TileColor.primary),
                                       Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
        let array = lineTwo.countArray
        #expect(array.counts.count == 1)
        #expect(array.counts[0] == 1)
    }

    @Test func testCountArrayOneTwo() async throws {
        let lineThree = TileLine(tiles: [Tile(),
                                         Tile(tileColor: TileColor.primary),
                                         Tile(tileColor: TileColor.primary),
                                         Tile(),Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
        let array = lineThree.countArray
        #expect(array.counts.count == 1)
        #expect(array.counts[0] == 2)
    }

    @Test func testCountArrayOneThree() async throws {
        let lineFour = TileLine(tiles: [Tile(),
                                        Tile(tileColor: TileColor.primary),
                                        Tile(tileColor: TileColor.primary),
                                        Tile(tileColor: TileColor.primary),
                                        Tile(),Tile(),Tile(),Tile(),Tile(),Tile()])
        let array = lineFour.countArray
        #expect(array.counts.count == 1)
        #expect(array.counts[0] == 3)
    }

}

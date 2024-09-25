//
//  ExamplePuzzles.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/25/24.
//

struct ExamplePuzzles {
    static var dash: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 2))
        puz.update(color: .primary, location: Location(x: 1, y: 2))
        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 2))
        puz.update(color: .primary, location: Location(x: 4, y: 2))
        puz.update(color: .primary, location: Location(x: 5, y: 2))
        puz.update(color: .primary, location: Location(x: 6, y: 2))
        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 8, y: 2))
        puz.update(color: .primary, location: Location(x: 9, y: 2))

        return puz
    }

    static var fourDots: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 2))

        puz.update(color: .primary, location: Location(x: 2, y: 3))
        puz.update(color: .primary, location: Location(x: 3, y: 3))

        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 8, y: 2))

        puz.update(color: .primary, location: Location(x: 7, y: 3))
        puz.update(color: .primary, location: Location(x: 8, y: 3))

        puz.update(color: .primary, location: Location(x: 2, y: 7))
        puz.update(color: .primary, location: Location(x: 3, y: 7))

        puz.update(color: .primary, location: Location(x: 2, y: 8))
        puz.update(color: .primary, location: Location(x: 3, y: 8))

        puz.update(color: .primary, location: Location(x: 7, y: 7))
        puz.update(color: .primary, location: Location(x: 8, y: 7))

        puz.update(color: .primary, location: Location(x: 7, y: 8))
        puz.update(color: .primary, location: Location(x: 8, y: 8))

        return puz
    }

    static var crosshair: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 4, y: 0))
        puz.update(color: .primary, location: Location(x: 4, y: 1))
        puz.update(color: .primary, location: Location(x: 4, y: 2))
        puz.update(color: .primary, location: Location(x: 4, y: 3))
        puz.update(color: .primary, location: Location(x: 4, y: 4))
        puz.update(color: .primary, location: Location(x: 4, y: 5))
        puz.update(color: .primary, location: Location(x: 4, y: 6))
        puz.update(color: .primary, location: Location(x: 4, y: 7))
        puz.update(color: .primary, location: Location(x: 4, y: 8))
        puz.update(color: .primary, location: Location(x: 4, y: 9))

        puz.update(color: .primary, location: Location(x: 0, y: 4))
        puz.update(color: .primary, location: Location(x: 1, y: 4))
        puz.update(color: .primary, location: Location(x: 2, y: 4))
        puz.update(color: .primary, location: Location(x: 3, y: 4))
        puz.update(color: .primary, location: Location(x: 5, y: 4))
        puz.update(color: .primary, location: Location(x: 6, y: 4))
        puz.update(color: .primary, location: Location(x: 7, y: 4))
        puz.update(color: .primary, location: Location(x: 8, y: 4))
        puz.update(color: .primary, location: Location(x: 9, y: 4))


        return puz
    }

    static var letterX: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 0))
        puz.update(color: .primary, location: Location(x: 1, y: 1))
        puz.update(color: .primary, location: Location(x: 2, y: 2))
        puz.update(color: .primary, location: Location(x: 3, y: 3))
        puz.update(color: .primary, location: Location(x: 4, y: 4))
        puz.update(color: .primary, location: Location(x: 5, y: 5))
        puz.update(color: .primary, location: Location(x: 6, y: 6))
        puz.update(color: .primary, location: Location(x: 7, y: 7))
        puz.update(color: .primary, location: Location(x: 8, y: 8))
        puz.update(color: .primary, location: Location(x: 9, y: 9))

        puz.update(color: .primary, location: Location(x: 9, y: 0))
        puz.update(color: .primary, location: Location(x: 8, y: 1))
        puz.update(color: .primary, location: Location(x: 7, y: 2))
        puz.update(color: .primary, location: Location(x: 6, y: 3))
        puz.update(color: .primary, location: Location(x: 5, y: 4))
        puz.update(color: .primary, location: Location(x: 4, y: 5))
        puz.update(color: .primary, location: Location(x: 3, y: 6))
        puz.update(color: .primary, location: Location(x: 2, y: 7))
        puz.update(color: .primary, location: Location(x: 1, y: 8))
        puz.update(color: .primary, location: Location(x: 0, y: 9))

        return puz
    }

    static var framed: Puzzle {
        let puz = Puzzle()

        puz.update(color: .primary, location: Location(x: 0, y: 0))
        puz.update(color: .primary, location: Location(x: 1, y: 0))
        puz.update(color: .primary, location: Location(x: 2, y: 0))
        puz.update(color: .primary, location: Location(x: 3, y: 0))
        puz.update(color: .primary, location: Location(x: 4, y: 0))
        puz.update(color: .primary, location: Location(x: 5, y: 0))
        puz.update(color: .primary, location: Location(x: 6, y: 0))
        puz.update(color: .primary, location: Location(x: 7, y: 0))
        puz.update(color: .primary, location: Location(x: 8, y: 0))
        puz.update(color: .primary, location: Location(x: 9, y: 0))

        puz.update(color: .primary, location: Location(x: 0, y: 9))
        puz.update(color: .primary, location: Location(x: 1, y: 9))
        puz.update(color: .primary, location: Location(x: 2, y: 9))
        puz.update(color: .primary, location: Location(x: 3, y: 9))
        puz.update(color: .primary, location: Location(x: 4, y: 9))
        puz.update(color: .primary, location: Location(x: 5, y: 9))
        puz.update(color: .primary, location: Location(x: 6, y: 9))
        puz.update(color: .primary, location: Location(x: 7, y: 9))
        puz.update(color: .primary, location: Location(x: 8, y: 9))
        puz.update(color: .primary, location: Location(x: 9, y: 9))

        puz.update(color: .primary, location: Location(x: 0, y: 1))
        puz.update(color: .primary, location: Location(x: 0, y: 2))
        puz.update(color: .primary, location: Location(x: 0, y: 3))
        puz.update(color: .primary, location: Location(x: 0, y: 4))
        puz.update(color: .primary, location: Location(x: 0, y: 5))
        puz.update(color: .primary, location: Location(x: 0, y: 6))
        puz.update(color: .primary, location: Location(x: 0, y: 7))
        puz.update(color: .primary, location: Location(x: 0, y: 8))

        puz.update(color: .primary, location: Location(x: 9, y: 1))
        puz.update(color: .primary, location: Location(x: 9, y: 2))
        puz.update(color: .primary, location: Location(x: 9, y: 3))
        puz.update(color: .primary, location: Location(x: 9, y: 4))
        puz.update(color: .primary, location: Location(x: 9, y: 5))
        puz.update(color: .primary, location: Location(x: 9, y: 6))
        puz.update(color: .primary, location: Location(x: 9, y: 7))
        puz.update(color: .primary, location: Location(x: 9, y: 8))

        return puz
    }

    static var rainbow: Puzzle {
        let puz = Puzzle()

        puz.update(color: .empty, location: Location(x: 0, y: 0))
        puz.update(color: .primary, location: Location(x: 1, y: 0))
        puz.update(color: .second, location: Location(x: 2, y: 0))
        puz.update(color: .third, location: Location(x: 3, y: 0))
        puz.update(color: .fourth, location: Location(x: 4, y: 0))
        puz.update(color: .fifth, location: Location(x: 5, y: 0))
        puz.update(color: .sixth, location: Location(x: 6, y: 0))
        puz.update(color: .seventh, location: Location(x: 7, y: 0))
        puz.update(color: .eighth, location: Location(x: 8, y: 0))
        puz.update(color: .ninth, location: Location(x: 9, y: 0))

        return puz
    }
}

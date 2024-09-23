//
//  TileColor.swift
//  HanjiePuzzleCreator
//
//  Created by Hasan Edain on 9/23/24.
//

import Foundation
import SwiftUI

enum TileColor: Codable, Equatable, Hashable, Comparable, CustomDebugStringConvertible {
    case empty
    case primary
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth

    var debugDescription: String {
        switch self {
            case .empty:
                return "Empty"
            case .primary:
                return "Primary"
            case .second:
                return "Secondary"
            case .third:
                return "Tertiary"
            case .fourth:
                return "Fourth"
            case .fifth:
                return "Fifth"
            case .sixth:
                return "Sixth"
            case .seventh:
                return "Seventh"
            case .eighth:
                return "Eigth"
            case .ninth:
                return "Ninth"
        }
    }

    var color: Color {
        switch self {
            case .empty:
                return .white
            case .primary:
                return .black
            case .second:
                return .blue
            case .third:
                return .green
            case .fourth:
                return .gray
            case .fifth:
                return .brown
            case .sixth:
                return .red
            case .seventh:
                return .yellow
            case .eighth:
                return .orange
            case .ninth:
                return .purple
        }
    }

}

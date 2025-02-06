//
//  Currency.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 06/02/2025.
//

import SwiftUI

// MODEL & ENUMS
enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1

    //  Every Enum should have a id if we make is case iterable
    var id: Double { rawValue }
    
    // COMPUTED VALUES
    var image: ImageResource {
        switch self {
        case .copperPenny:
            .copperpenny
        case .silverPenny:
            .silverpenny
        case .silverPiece:
            .silverpiece
        case .goldPenny:
            .goldpenny
        case .goldPiece:
            .goldpiece
        }
    }

    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
}

//
//  ExhangeInfo.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 05/02/2025.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                // Title Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                // Description Text
                Text(
                    "Here at the Pracning Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:"
                )
                .font(.title3)
                .padding()
                // Exchange Rates

                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny);
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Piece", rightImage: .silverpiece);
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny);
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny);

                // Done Button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.white)
                    
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


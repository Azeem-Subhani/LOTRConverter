//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 05/02/2025.
//
import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @State var leftCurrency: Currency
    @State var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: leftCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.vertical)
                // Currency icons
                
                // Currency icons
                IconGrid(currency: rightCurrency)
                
                // Done Button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.white)
            }.padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: Currency.silverPiece, rightCurrency: Currency.goldPenny)
}

//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 05/02/2025.
//
import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
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
                IconGrid(currency: $topCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.vertical)
                // Currency icons
                
                // Currency icons
                IconGrid(currency: $bottomCurrency)
                
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
    @Previewable @State var topCurrency: Currency = .copperPenny;
    @Previewable @State var bottomCurrency: Currency = .goldPenny;
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}

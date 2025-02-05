//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 04/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var showExchangeInfo = false;
    
    var body: some View {
        ZStack {
            // Backgroud Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit() // Maintain the original height and width ratio
                    .frame(height: 200)
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                // Conversion Section
                HStack {
                    // Left Conversion Section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        // Text Field
                        Text("Text Field!")
                    }
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            // Currency Image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        // Text Field
                        Text("Text Field");
                    }
                }
                Spacer()
                // Info Button
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print("Show Exchange Value: ", showExchangeInfo);
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                }
            }
            .border(.blue)
        }
    }
}
// This this tells xcode to show the preview
#Preview {
    ContentView()
}

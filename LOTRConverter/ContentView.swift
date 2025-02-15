//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Azeem Subhani on 04/02/2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    // Modal Opening and Closing State
    @State var showExchangeInfo: Bool = false;
    @State var showSelectCurrency: Bool = false;
    
    // Currency Amount State
    @State var leftAmount: String = "";
    @State var rightAmount: String = "";
    
    @FocusState var leftTypingFocus: Bool;
    @FocusState var rightTypingFocus: Bool;
    
    @State var leftCurrency: Currency = .silverPiece;
    @State var rightCurrency: Currency = .goldPiece;
    
    let currencyTip = CurrencyTip();
    
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
                    HStack {
                        // Left Conversion Section
                        VStack {
                            // Currency
                            HStack {
                                // Currency Image
                                Image(leftCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)

                                // Currency Text
                                Text(leftCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }.padding(.bottom, -2)
                                .onTapGesture {
                                    showSelectCurrency.toggle()
                                    currencyTip.invalidate(reason: .actionPerformed)
                                }
                                .popoverTip(currencyTip, arrowEdge: .bottom)
                            
                            // Text Field
                            TextField("Amount", text: $leftAmount)
                                .textFieldStyle(.roundedBorder)
                                .focused($leftTypingFocus)
                        }
                        // Equal Signf
                        Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse)
                        
                        // Right Conversion Section
                        VStack {
                            // Currency
                            HStack {
                                // Currency Text
                                Text(rightCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                // Currency Image
                                Image(rightCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                            }.padding(.bottom, -2)
                                .onTapGesture {
                                    showSelectCurrency.toggle()
                                    currencyTip.invalidate(reason: .actionPerformed)
                                }
                            
                            // Text Field
                            TextField("Right Amount", text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .focused($rightTypingFocus)
                                .multilineTextAlignment(.trailing)
                        }
                    }.padding(30)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.5)))
                }.padding(10)
                    .keyboardType(.decimalPad)
                    
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
            .task {
                try? Tips.configure()
            }
            // Listening to the changes on the stack
            .onChange(of: leftAmount) {
                if(leftTypingFocus) {
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if(rightTypingFocus) {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        }
    }
}
// This this tells xcode to show the preview
#Preview {
    ContentView()
}

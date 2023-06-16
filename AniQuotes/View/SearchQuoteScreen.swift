//
//  SearchQuoteScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI

struct SearchQuoteScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @State var isFirstAppear: Bool = true
    @State var quoteID = UUID()
    var body: some View {
        ZStack {
            VStack {
                if quoteManager.currentQuote != nil {
                    QuoteView(
                        quote: quoteManager.currentQuote!
                    )
                    .id(quoteID)
                    .transition(.moveLeading)
                    .onChange(of: quoteManager.currentQuote?.id) { newValue in
                        print("new currentQuoteID is \(newValue)")
                        withAnimation {
                            quoteID = UUID()
                        }
                        
                    }
                } else {
                    ProgressView()
                }
                    
            }
            
            HStack {
                VerticalButtonView(width: 70) {
                    self.quoteManager.previousCurrentQuoteIndex()
                }
                
                Spacer()
                
                VerticalButtonView(width: 70) {
                    self.quoteManager.nextQuote()
                }
                
                
            }
        }
        .onAppear {
            if isFirstAppear {
                self.quoteManager.nextQuote()
                isFirstAppear = false
            }
        }
        
    }
    
}

struct SearchQuoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchQuoteScreen()
            .environmentObject(QuoteManager.shared)
    }
}

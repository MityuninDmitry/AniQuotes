//
//  SearchQuoteScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI

struct SearchQuoteScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var body: some View {
        VStack {
            Spacer()
            
            if quoteManager.quotes.count > 0 {
                QuoteView(quote: quoteManager.quotes.last!)
            }
            
            Spacer()
            
            Button {
                quoteManager.randomQuote()
            } label: {
                Text("Print random quotes")
            }
        }
        .padding()
    }
}

struct SearchQuoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchQuoteScreen()
            .environmentObject(QuoteManager.shared)
    }
}

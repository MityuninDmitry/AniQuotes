//
//  QuoteView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteView: View {
    var quote: Quote
    var body: some View {
        VStack(alignment: .leading) {
            Text(quote.quote)
            
            HStack {
                Spacer()
                Text(quote.character)
            }
            
            
            HStack {
                Spacer()
                Text(quote.anime)
            }
        }
        .padding(.horizontal, 50)
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(key: 1, anime: "NameANIME", character: "Saitama", quote: "Something sdasd,mansd,n", v: 1.1))
    }
}

//
//  QuoteView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var quote: Quote
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(quote.quote)
            
            HStack {
                Spacer()
                Text(quote.character)
            }
            
            
            HStack {
                Spacer()
                Text(quote.anime)
            }
            
            
            HStack {
                Spacer()
                
                if quoteManager.isFavorite(quote: self.quote) {
                    Button {
                        quoteManager.removeFavorite(quote: self.quote)
                    } label: {
                        Image.init(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 25))
                    }
                    
                } else {
                    Button {
                        quoteManager.appendToFavoriteQuotes(quote: self.quote)
                    } label: {
                        Image.init(systemName: "star")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                
                
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 50)
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(key: 1, anime: "NameANIME", character: "Saitama", quote: "Something sdasd,mansd,n", v: 1.1))
            .environmentObject(QuoteManager.shared)
    }
}

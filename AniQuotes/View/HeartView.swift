//
//  HeartView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/24/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct HeartView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @EnvironmentObject var quote: QuoteViewModel
    @State var isFavorite: Bool = false
    var body: some View {
        ZStack {
            Image.init(systemName: "heart.fill")
                .foregroundColor(.red)
                .opacity(isFavorite ? 1 : 0)
            
            Image.init(systemName: "heart")
        }
        .onTapGesture {
            if quote.isFavorite {
                quoteManager.removeFavorite(quote: quote)
                quote.isFavorite = false
            } else {
                quoteManager.appendToFavoriteQuotes(quote: quote)
                quote.isFavorite = true
            }
            
            withAnimation(.easeInOut(duration: 1)) {
                isFavorite = quote.isFavorite
            }
        }
        .onAppear {
            quoteManager.updateIsFavoriteFor(quote: quote)
            isFavorite = quote.isFavorite
        }
        
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView()
            .environmentObject(QuoteManager.shared)
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.1, anime: "Anime", character: "Character", quote: "QUOTE", v: 0.1)))
    }
}

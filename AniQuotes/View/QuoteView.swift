//
//  QuoteView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteView: View {
    @EnvironmentObject var quote: QuoteViewModel
    
    var body: some View {
        QuoteTextView()
            .environmentObject(quote)
//        if quote.isUploadedFully {
//            ZStack {
//                QuoteImageView()
//                    .environmentObject(quote)
//
//                VStack {
//                    Spacer()
//                    QuoteTextView()
//                        .environmentObject(quote)
//                }
//
//                FavoriteView(quote: quote, isFavorite: $isFavorite)
//
//            }
//
//        } else {
//            ProgressView()
//        }
//
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        
        QuoteView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
        
    }
}

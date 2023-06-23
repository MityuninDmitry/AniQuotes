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
        ZStack {
            ImageView()
                .environmentObject(quote)
            VStack {
                Spacer()
                
                TextView()
                    .environmentObject(quote)
                    .padding(.horizontal, 10)
                NavigationButtonsView()
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        
        QuoteView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
        
    }
}

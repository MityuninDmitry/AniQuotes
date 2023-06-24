//
//  FavoriteQuotesScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/12/23.
//

import SwiftUI

struct FavoriteQuotesScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(quoteManager.favoriteQuotes.enumerated()), id:\.element) { index, item in
                    Text(item.quote.character)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct FavoriteQuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteQuotesScreen()
            .environmentObject(QuoteManager.shared)
    }
}

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
        Text("")
//        List(quoteManager.favoriteQuotes, id: \.key) { quote in
//            Text(quote!.character)
//        }
//        .listStyle(.plain)
    }
}

struct FavoriteQuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteQuotesScreen()
            .environmentObject(QuoteManager.shared)
    }
}

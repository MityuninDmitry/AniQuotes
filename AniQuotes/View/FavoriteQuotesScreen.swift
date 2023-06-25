//
//  FavoriteQuotesScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/12/23.
//

import SwiftUI
import NavigationStackCustom

struct FavoriteQuotesScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    
    var body: some View {
        ZStack {
            ImageView()
                .opacity(0.5)
                .environmentObject(quoteManager.backgroundImage)
            
            AppNavigationView {
                VStack {
                    List {
                        ForEach(Array(quoteManager.favoriteQuotes.enumerated()), id:\.element) { index, item in
                            AppNavigationViewNext(destination: QuoteView().environmentObject(item)) {
                                QuoteCellView(index: index)
                                    .environmentObject(quoteManager)
                                    .environmentObject(item)
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear {
                quoteManager.favoriteQuotes.sort(by: {$0.quote.anime < $1.quote.anime })
            }
            
            
        }
        
       
    }
}

struct FavoriteQuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteQuotesScreen()
            .environmentObject(QuoteManager.shared)
    }
}

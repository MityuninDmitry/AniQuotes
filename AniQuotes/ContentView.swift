//
//  ContentView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/10/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct ContentView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @EnvironmentObject var tabManager: TabManager
    
    var body: some View {
        
        TabView(selection: $tabManager.seletedTabId) {
            SearchQuoteScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(0)
                
            
            FavoriteQuotesScreen()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(1)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuoteManager.shared)
            .environmentObject(TabManager.shared)
    }
}

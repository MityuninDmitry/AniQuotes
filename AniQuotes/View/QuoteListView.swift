//
//  QuoteListView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/23/23.
//

import SwiftUI
import NavigationStackCustom

struct QuoteListView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var body: some View {
        VStack {
            List {
                ForEach(Array(quoteManager.quotes.enumerated()), id: \.element) { index, item in
                    AppNavigationViewNext(destination: QuoteView().environmentObject(item)) {
                        QuoteCellView(index: index)
                            .environmentObject(quoteManager)
                            .environmentObject(item)
                    }
                    .onAppear {
                        if self.quoteManager.quotes.isLastItem(item) {
                            self.quoteManager.fetchQuotes()
                        }
                    }
                    
                    
                    
                }
            }
            .listStyle(.plain)
            
            if quoteManager.isLoadedFully {
                Text("You uploaded everything!")
            }
            
            
            NavigationButtonsView()
        }
        
    }
}

struct QuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListView()
            .environmentObject(QuoteManager.shared)
    }
}

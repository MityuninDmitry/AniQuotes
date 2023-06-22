//
//  SearchQuoteScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import WaifuPicsNetwork
import NavigationStackCustom

struct SearchQuoteScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @State var isFirstAppear: Bool = true
    var body: some View {
        AppNavigationView {
            VStack {
                List {
                    ForEach(Array(quoteManager.quotes.enumerated()) , id: \.element) { index, quote in
                        AppNavigationViewNext(destination: QuoteView().environmentObject(quote)) {
                            Text("\(index). \(quote.quote.anime) | \(quote.quote.character)")
                                .onAppear {
                                    if quoteManager.quotes.isLastItem(quote) {
                                        quoteManager.fetch()
                                    }
                                }
                        }
                        
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    if self.isFirstAppear {
                        quoteManager.fetch()
                        self.isFirstAppear = false
                    }
                }
                
                Spacer()
                
                if quoteManager.isLoadedFully {
                    Text("You uploaded everything!")
                }
                
                AnimePickerView()
                    .environmentObject(quoteManager)
                
            }
        }
    }
    
}

struct SearchQuoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchQuoteScreen()
            .environmentObject(QuoteManager.shared)
    }
}

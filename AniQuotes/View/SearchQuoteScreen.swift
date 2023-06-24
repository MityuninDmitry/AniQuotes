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
    @State var textForSearching: String? = nil {
        didSet {
            if textForSearching != nil { 
                quoteManager.textForSearching = textForSearching
            }
            
        }
    }
    var body: some View {
        AppNavigationView {
            VStack {
                List {
                    ForEach(Array(quoteManager.categories.enumerated()) , id: \.element) { index, item in
                        AppNavigationViewNext(destination: QuoteListView().environmentObject(quoteManager)) {
                            Text("\(index). \(item)")
                        } actionOnTap: {
                            //self.quoteManager.animeTitle = item // так выдает ошибку xCode
                            self.textForSearching = item
                        }
                        
                        
                        
                    }
                }
                .listStyle(.plain)
                
                
                Spacer()
                
                CategoryPickerView()
                    .environmentObject(quoteManager)
            }
            
        }
        .onAppear {
            if quoteManager.categories.isEmpty {
                quoteManager.fetchCategories()
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

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
        ZStack {
            ImageView()
                .opacity(0.5)
                .environmentObject(quoteManager.backgroundImage)
            
            AppNavigationView {
                VStack {
                    List {
                        ForEach(Array(quoteManager.headers.enumerated()) , id: \.element) { index, item in
                            AppNavigationViewNext(destination: QuoteListView(header: item).environmentObject(quoteManager)) {
                                HStack {
                                    Text("\(index). \(item)")
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                                
                            } actionOnTap: {
                                //self.quoteManager.animeTitle = item // так выдает ошибку xCode
                                self.textForSearching = item
                            }
                            .listRowBackground(Color.clear)
                            
                            
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        quoteManager.refreshBackgroundImage()
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    CategoryPickerView()
                        .environmentObject(quoteManager)
                }
                
            }
            .onAppear {
                if quoteManager.headers.isEmpty {
                    quoteManager.fetchHeaders()
                }
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

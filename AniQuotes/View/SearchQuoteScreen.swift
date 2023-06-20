//
//  SearchQuoteScreen.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import WaifuPicsNetwork

struct SearchQuoteScreen: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @State var isFirstAppear: Bool = true
    @State var canUploadNextQuote: Bool = true
    @State var selectedImageCategory: SwfCategory = .neko
    
    var body: some View {
        ZStack {
            
            
            VStack {
                if quoteManager.currentQuote != nil {
                    VStack {
                        QuoteView(
                            quote: quoteManager.currentQuote!
                        )
                        .onChange(of: quoteManager.currentQuoteIndex!) { newValue in
                                canUploadNextQuote = true
                        }
                        
                        CategoryPickerView(selectedImageCategory: $selectedImageCategory)
                    }
                    
                } else {
                    ProgressView()
                }
                    
            }
            
            HStack {
                VerticalButtonView(width: 70) {
                    self.quoteManager.previousCurrentQuoteIndex()
                }
                
                Spacer()
                
                if canUploadNextQuote {
                    VerticalButtonView(width: 70) {
                        self.quoteManager.nextQuote(imageCategory: self.selectedImageCategory)
                        
                        canUploadNextQuote = false
                        
                    }
                }
                
            }
            
            VStack {
                if !canUploadNextQuote {
                    ProgressView()
                        .scaleEffect(2)
                        .colorInvert()
                        .shadow(radius: 5)
                }
            }
        }
        .onAppear {
            if isFirstAppear {
                self.quoteManager.nextQuote(imageCategory: selectedImageCategory)
                isFirstAppear = false
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

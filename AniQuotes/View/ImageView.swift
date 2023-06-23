//
//  QuoteImageView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct ImageView: View {
    @EnvironmentObject var quote: QuoteViewModel
    var body: some View {
        VStack {
            if quote.image != nil {
                GeometryReader { reader in
                    Image(uiImage: quote.image!)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: reader.size.width, alignment: .center)
                }
                
                
            } else {
                ProgressView()
                    .onAppear {
                        if quote.image == nil {
                            quote.fetchImage()
                        }
                    }
            }
        }
       
    }
}

struct QuoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
        
    }
}

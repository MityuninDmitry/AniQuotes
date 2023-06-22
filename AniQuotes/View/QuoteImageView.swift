//
//  QuoteImageView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteImageView: View {
    @EnvironmentObject var quote: QuoteViewModel
    var body: some View {
        Text("")
//        if quote.image != nil {
//            VStack {
//                GeometryReader { reader in
//                    Image(uiImage: quote.image!)
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.top)
//                        .frame(width: reader.size.width, alignment: .center)
//                }
//            }
//
//        }
    }
}

struct QuoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteImageView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
            
    }
}

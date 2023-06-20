//
//  QuoteImageView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteImageView: View {
    var quote: QuoteWrapper
    var body: some View {
        if quote.image != nil {
            VStack {
                GeometryReader { reader in
                    Image(uiImage: quote.image!)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: reader.size.width, alignment: .center)
                }
            }

        }
    }
}

struct QuoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteImageView(
            quote: QuoteWrapper(
                id: 0,
                quote: Quote(
                    key: 1,
                    anime: "NameANIME",
                    character: "Saitama",
                    quote: "Something sdasd,mansd,n sdfk sjd,f s,dmfn s,dfn s,mdfn,smdnf ,smdnf ,msdn f,msdnf ,msndf,msnd,fmn ", v: 1.1),
                imageURL: "https://i.waifu.pics/RBGn36s.jpeg",
                action: {print("hello")}))
    }
}

//
//  NavigationButtonView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/25/23.
//

import SwiftUI

struct NavigationButtonView: View {
    var buttonText: String = ""
    var body: some View {
        HStack {
            Spacer()
            
            Text(buttonText)
                .padding(.vertical, 4)
            
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: .init(lineWidth: 1))
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView()
    }
}

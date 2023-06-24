//
//  NavigationButtonsView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/23/23.
//

import SwiftUI
import NavigationStackCustom

struct NavigationButtonsView: View {
    var body: some View {
        HStack {
            HStack {
                Spacer()
                AppNavigationViewBack(destination: .previous) {
                    Text("Go back")
                }
                .padding(.vertical, 4)
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: .init(lineWidth: 1))
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
            .padding(.horizontal, 1)
            
            HStack {
                Spacer()
                AppNavigationViewBack(destination: .root) {
                    Text("Go root")
                }
                .padding(.vertical, 4)
                Spacer()
            }
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: .init(lineWidth: 1))
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(.horizontal, 1)
            
        }
        .padding(.vertical, 2)
        .background(.indigo)
        .clipShape(
            RoundedRectangle(cornerRadius: 5)
        )
        
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView()
    }
}

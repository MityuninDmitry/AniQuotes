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
            Spacer()
            AppNavigationViewBack(destination: .previous) {
                Text("Go back")
                    .padding(5)
            }
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: .init(lineWidth: 1))
            }
            Spacer()
            AppNavigationViewBack(destination: .root) {
                Text("Go root")
                    .padding(5)
                
            }
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: .init(lineWidth: 1))
            }
            Spacer()
        }
        .padding()
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView()
    }
}

//
//  CategoryPickerView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import WaifuPicsNetwork

struct CategoryPickerView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @State var selectedSearchType: SearchType = QuoteManager.shared.searchType
    private var searchTypes: [SearchType] = [.AnimeTitle, .CharacterName]
     
    var body: some View {
        Picker("Choose image category", selection: $selectedSearchType) {
            ForEach(searchTypes, id: \.self) { category in
                Text("\(category.rawValue)")
            }
        }
        .onChange(of: selectedSearchType, perform: { newValue in
            quoteManager.searchType = newValue
        })
        .pickerStyle(.segmented)
        .onAppear {
            UISegmentedControl.appearance().backgroundColor = .systemIndigo
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        }
        .shadow(radius: 3)
        .frame(height: 40)
    }
}

struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerView()
            .environmentObject(QuoteManager.shared)
    }
}

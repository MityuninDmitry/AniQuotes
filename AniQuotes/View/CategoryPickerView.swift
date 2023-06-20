//
//  CategoryPickerView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import WaifuPicsNetwork

struct CategoryPickerView: View {
    @Binding var selectedImageCategory: SwfCategory
    var imageCategories: [SwfCategory] = [.neko,.waifu,.awoo]
     
    var body: some View {
        Picker("Choose image category", selection: $selectedImageCategory) {
            ForEach(imageCategories, id: \.self) { category in
                Text("\(category.rawValue)")
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
            UISegmentedControl.appearance().backgroundColor = .systemIndigo
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        }
        .shadow(radius: 3)
    }
}

struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPickerView(selectedImageCategory: .constant(.neko))
    }
}

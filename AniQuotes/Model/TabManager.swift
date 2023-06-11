//
//  TabManager.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import Foundation
class TabManager: ObservableObject {
    static let shared = TabManager()
    
    
    
    var seletedTabId: Int

    private init(selectedTabId: Int = 0) {
        self.seletedTabId = selectedTabId
    }

}

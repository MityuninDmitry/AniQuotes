//
//  File.swift
//  
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import Foundation
import SwiftUI

final public class AppNavigationViewModel: ObservableObject {
    @Published var current: Screen?
    var navigationType: NavigationType = .append
    
    private var screenStack: ScreenStack = .init() {
        didSet {
            current = screenStack.last()
        }
    }
    
    func append<S: View>(_ screen: S) {
        let screen: Screen = .init(id: UUID(), nextScreen: AnyView(screen))
        navigationType = .append
        
        screenStack.append(screen)
    }
    
    func go(to: BackDestination = .previous)  {
        navigationType = .last
        switch to {
        case .previous:
            screenStack.goToPrevious()
        case .root:
            screenStack.goToRoot()
        }
        
    }
}

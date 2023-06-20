//
//  File.swift
//  
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import Foundation
import SwiftUI

struct Screen: Identifiable, Equatable {
    
    let id: UUID
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}


//
//  AnyTransition.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/15/23.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveLeading: AnyTransition {
        return AnyTransition.move(edge: .trailing)
    }
}

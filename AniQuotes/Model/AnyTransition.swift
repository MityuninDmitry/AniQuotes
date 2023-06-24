//
//  AnyTransition.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/15/23.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveBottomScaled: AnyTransition {
        return AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

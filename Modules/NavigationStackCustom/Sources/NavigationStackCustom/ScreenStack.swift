//
//  File.swift
//  
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import Foundation

struct ScreenStack {
    private var screens: [Screen] = .init()
    
    func last() -> Screen? { // возвращает последний добавленный
        screens.last
    }
    
    mutating func append(_ s: Screen) { // добавляет в конец списка
        screens.append(s)
    }
    
    mutating func goToPrevious() { // убирает последний из списка
        _ = screens.popLast()
    }
    
    mutating func goToRoot() { // обнуляет стек
        screens.removeAll()
    }
}

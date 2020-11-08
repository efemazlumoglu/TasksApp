//
//  EnvironmentKeys.swift
//  TasksApp
//
//  Created by Efe Mazlumoğlu on 8.11.2020.
//

import Foundation
import SwiftUI

struct WindowKey: EnvironmentKey {
    struct Value {
        weak var value: UIWindow?
    }
    
    static let defaultValue: Value = .init(value: nil)
}

extension EnvironmentValues {
    var window: UIWindow? {
        get { return self[WindowKey.self].value }
        set { self[WindowKey.self] = .init(value: newValue) }
    }
}

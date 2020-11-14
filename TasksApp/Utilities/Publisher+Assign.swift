//
//  Publisher+Assign.swift
//  TasksApp
//
//  Created by Efe Mazlumoğlu on 14.11.2020.
//

import Foundation
import Combine

extension Publisher where Failure == Never {
    func assign<Root: AnyObject>(to keyPath: ReferenceWritableKeyPath<Root, Output>, on root: Root) -> AnyCancellable {
        sink {
            [weak root] in
            root?[keyPath: keyPath] = $0
        }
    }
}

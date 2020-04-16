//
//  Bindable.swift
//  DatingPlatformApplication
//
//  Created by SEAN on 2019/2/7.
//  Copyright © 2019 SEAN. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}

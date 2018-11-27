//
//  Dictionary.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation

extension Dictionary {
    
    mutating func unionInPlace(
        dictionary: Dictionary<Key, Value>) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }
    
    mutating func unionInPlace<S: Sequence>(sequence: S) where
        S.Iterator.Element == (Key,Value) {
            for (key, value) in sequence {
                self[key] = value
            }
    }
}

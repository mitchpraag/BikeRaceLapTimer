//
//  riderClass.swift
//  BikeRaceLapTimer
//
//  Created by Mitch Praag on 10/3/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
class Rider: Equatable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
func == (lhs: Rider, rhs: Rider) -> Bool {
    return lhs.name == rhs.name
}

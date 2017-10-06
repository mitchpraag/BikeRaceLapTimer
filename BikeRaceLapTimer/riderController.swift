//
//  riderController.swift
//  BikeRaceLapTimer
//
//  Created by Mitch Praag on 10/3/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
class RiderController {
    static let shareInstance = RiderController()
    var riders = [Rider]()
    
    func create(riderWithName name: String){
        let rider = Rider(name: name)
        riders.append(rider)
    }
    func delete(rider: Rider) {
        guard let index = riders.index(of: rider) else { return }
        riders.remove(at: index)
        
    }
}

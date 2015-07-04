//
//  SpatialNode.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

protocol SpatialObject {
    var longitude: Double { get set }
    var latitude: Double { get set }
    
    func centroid() -> CLLocationCoordinate2D!
    
}


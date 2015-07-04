//
//  Node.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa
import MapKit

class Node : SpatialObject {
    var longitude: Double
    var latitude: Double 
    var label: String?
    var neighbors: Array<Edge>
    var degree: Int { return self.neighbors.count }
    
    init() {
        self.longitude = -77
        self.latitude = 36
        self.neighbors = Array<Edge>()
        self.label = "Node"
    }
    
    init( label: String ){
        self.longitude = -77
        self.latitude = 36
        self.neighbors = Array<Edge>()
        self.label = label
    }
    
    func centroid() -> CLLocationCoordinate2D! {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
}
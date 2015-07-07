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

class Node : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var neighbors: Array<Edge> = Array<Edge>()
    var degree: Int { return self.neighbors.count }
    
    override init() {
        self.title = "Node"
        self.coordinate = CLLocationCoordinate2D(latitude: 37.544851, longitude: -77454472 )
        super.init()
    }
    
    init( title: String ){
        self.title = title
        self.coordinate = CLLocationCoordinate2D(latitude: 37.544851, longitude: -77454472 )
        super.init()
    }
    
    
}
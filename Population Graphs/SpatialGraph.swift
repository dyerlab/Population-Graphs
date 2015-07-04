//
//  SpatialGraph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit


class SpatialGraph : Graph, SpatialObject {
    var longitude: Double {
        get {
            return self.centroid().longitude
        }
        set {}
    }
    var latitude: Double {
        get {
            return self.centroid().latitude
        }
        set {}
    }
    
    func centroid() -> CLLocationCoordinate2D! {
        var lat: Double = 0.0
        var lon: Double = 0.0
        let N = Double(self.nodes.count)
        
        for n in self.nodes {
            lon += n.longitude
            lat += n.latitude
        }
        lat /= N
        lon /= N
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    
    func region() -> MKCoordinateRegion {
        var minLon: Double = Double.infinity
        var minLat: Double = Double.infinity
        var maxLon: Double = -Double.infinity
        var maxLat: Double = -Double.infinity
        
        for n in self.nodes {
            if n.longitude < minLon { minLon = n.longitude }
            else if n.longitude > maxLon { maxLon = n.longitude }
            
            if n.latitude < minLat { minLat = n.latitude }
            else if n.latitude > maxLat { maxLat = n.latitude }
        }
        let span: MKCoordinateSpan = MKCoordinateSpanMake((maxLat-minLat), (maxLon-minLon) )
        
        return MKCoordinateRegionMake( self.centroid(), span)
    }
    

}
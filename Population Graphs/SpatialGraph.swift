//
//  SpatialGraph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit


class SpatialGraph : Graph {
    
    
    func centroid() -> CLLocationCoordinate2D! {
        var lat: Double = 0.0
        var lon: Double = 0.0
        let N = Double(self.nodes.count)
        
        for n in self.nodes {
            lon += n.coordinate.longitude
            lat += n.coordinate.latitude
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
            if n.coordinate.longitude < minLon { minLon = n.coordinate.longitude }
            else if n.coordinate.longitude > maxLon { maxLon = n.coordinate.longitude }
            
            if n.coordinate.latitude < minLat { minLat = n.coordinate.latitude }
            else if n.coordinate.latitude > maxLat { maxLat = n.coordinate.latitude }
        }
        let span: MKCoordinateSpan = MKCoordinateSpanMake((maxLat-minLat), (maxLon-minLon) )
        
        return MKCoordinateRegionMake( self.centroid(), span)
    }
    

}
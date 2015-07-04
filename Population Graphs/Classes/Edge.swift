//
//  Edge.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation

struct Edge {
    let node1: Node
    let node2: Node
    let weight: Double
    
    init(n1: Node, n2: Node, weight: Double) {
        self.node1 = n1
        self.node2 = n2
        self.weight = weight
    }
    
    
}
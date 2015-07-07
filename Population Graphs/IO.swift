//
//  IO.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation



func makeGraphForViewing() -> SpatialGraph! {
    let graph: SpatialGraph = SpatialGraph()
    
    let n1 = Node(title: "Bass Pro")
    n1.coordinate.longitude = -77.449333
    n1.coordinate.latitude = 37.710806
    graph.nodes.append(n1)
    
    let n2 = Node(title: "South Anna")
    n2.coordinate.longitude = -77.42339
    n2.coordinate.latitude = 37.800511
    graph.nodes.append(n2)
    

    let n3 = Node(title: "Kreggers")
    n3.coordinate.longitude = -77.437147
    n3.coordinate.latitude = 37.691362
    graph.nodes.append(n3)
    

    let n4 = Node(title: "The Farm")
    n4.coordinate.longitude = -77.45053
    n4.coordinate.latitude = 37.741033
    graph.nodes.append(n4)
    
    let e1 = Edge(n1: n1, n2: n2, weight: 1.0)
    let e2 = Edge(n1: n1, n2: n3, weight: 1.0)
    let e3 = Edge(n1: n2, n2: n3, weight: 1.0)
    let e4 = Edge(n1: n3, n2: n4, weight: 2.0)
    graph.edges.append(e1)
    graph.edges.append(e2)
    graph.edges.append(e3)
    graph.edges.append(e4)
    

    
    return graph
}

func loadGraphFromPlist( path: String ) -> SpatialGraph! {
    
    
    if let myDict = NSDictionary(contentsOfFile: path) {
        let graph: Graph = Graph()
        
        // load the nodes
        let nodes = myDict["Nodes"] as! NSDictionary
        for (name, values) in nodes {
            let node: Node = Node(title: name as! String)
            
            node.coordinate.longitude = (values as! NSDictionary).valueForKey("Longitude") as! Double
            node.coordinate.latitude =  (values as! NSDictionary).valueForKey("Latitude") as! Double 
            
            graph.nodes.append(node)
        }
        
        
        let edges = myDict["Edges"] as! NSArray
        for e in edges {
            let dict = e as! NSDictionary
            if let n1 = graph.getNode(dict.valueForKey("Node 1") as! String) {
                if let n2 = graph.getNode(dict.valueForKey("Node 2") as! String) {
                    if let wt = dict.valueForKey("Weight")  {
                        let edge: Edge = Edge(n1: n1, n2: n2, weight: wt.doubleValue )
                        graph.edges.append(edge)
                        if let _ = dict.valueForKey("Directed") {
                            n1.neighbors.append(edge)
                        }
                        else {
                            n1.neighbors.append(edge)
                            n2.neighbors.append(edge)
                        }
                    }
                }
            }
        }
        
        
    }
    
    
    return nil
}
//
//  Graph.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation


class Graph {
    var nodes: Array<Node>
    var edges: Array<Edge>
    var numNodes: Int { return self.nodes.count }
    var numEdges: Int { return self.edges.count }
    
    init() {
        self.nodes = Array<Node>()
        self.edges = Array<Edge>()
    }
    
    
    func getNode( label: String ) -> Node! {
        for n in self.nodes {
            if n.title == label {
                return n
            }
        }
        return nil
    }
    
    func getEdge( label1: String, label2: String ) -> Edge! {
        for e in self.edges {
            if e.node1.title == label1 && e.node2.title == label2 {
                return e
            }
            else if e.node1.title == label2 && e.node2.title == label1 {
                return e
            }
        }
        return nil
    }
    

}

//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


let myDict = [
    "Nodes":[
        "A":"Bob",
        "B":"Alice",
        "C":"Fred"],
    "Edges":[
        [
            "Node 1":"A",
            "Node 2":"B",
            "Weight":6.4
            ],
        [
            "Node 1":"C",
            "Node 2":"B",
            "Weight":2.4
        ],
        [
            "Node 1":"A",
            "Node 2":"C",
            "Weight":3.4
        ] ]
]


print(myDict["Nodes"])

var nodes = myDict["Nodes"] as! NSDictionary
var edges = myDict["Edges"] as! NSArray
for e in edges {
    print(e)
}


var path = "/Users/rodney/Desktop/Population Graphs/Population Graphs/Network.plist"
if let myDict = NSDictionary(contentsOfFile: path) {
    
    let nodes = myDict["Nodes"] as! NSDictionary
    print(nodes.description)
    
    
    
}
else {
    print("Cannot read dictionary")
}

/*
func loadGraphFromPlist( path: String ) -> Graph! {
    
    
    if let myDict = NSDictionary(contentsOfFile: path) {
        let graph: Graph = Graph()
        
        // load the nodes
        let nodes = myDict["Nodes"] as! NSDictionary
        for (name, values) in nodes {
            let node: Node = Node(label: name as! String)
            
            node.longitude = (values as! NSDictionary).valueForKey("Longitude") as! Double
            node.latitude =  (values as! NSDictionary).valueForKey("Latitude") as! Double
            
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
*/



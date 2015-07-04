//
//  ViewController.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController {

    @IBOutlet var theMapView: MKMapView!
    var popgraph: SpatialGraph!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let path = NSBundle.mainBundle().pathForResource("Network", ofType: "plist") {
            print(path)
            popgraph = makeGraphForViewing()
            
            
            theMapView.setRegion(popgraph.region(), animated: true)
        }

        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


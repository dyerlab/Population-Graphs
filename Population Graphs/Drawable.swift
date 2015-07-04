//
//  Drawable.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 7/4/15.
//  Copyright © 2015 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

protocol Drawable {
    func moveTo(x: Double, y: Double)
    func draw()
}
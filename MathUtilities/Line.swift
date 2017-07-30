//
//  Line.swift
//  MathUtilities
//
//  Created by Allan Anderson on 2014-Nov-19.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Foundation

struct Line {
    var slope:Double
    var yIntercept:Double
    
    init(slope:Double, yIntercept:Double){
        self.slope = slope
        self.yIntercept = yIntercept
    }
    
    init(aPoint:Point, and bPoint:Point){
        slope = (bPoint.yCoordinate - aPoint.yCoordinate) / (bPoint.xCoordinate - aPoint.xCoordinate)
        yIntercept = aPoint.yCoordinate - slope * aPoint.xCoordinate
    }
    
    func toString() -> String{
        var lineString:String = "y = \(slope)x"
        if yIntercept < 0{
            lineString += " - \(yIntercept * -1)"
        }
        if yIntercept > 0{
            lineString += " + \(yIntercept)"
        }
        return lineString
    }
}

func SolveLine(_ lineA:Line, lineB:Line) -> Point{
    let x = (lineA.yIntercept - lineB.yIntercept) / (lineA.slope - lineB.slope)
    let y = x * lineA.slope + lineA.yIntercept
    let intersection = Point(x: x, y: y)
    return intersection
}

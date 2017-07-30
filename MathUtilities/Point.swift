//
//  Point.swift
//  MathUtilities
//
//  Created by Allan Anderson on 08/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Foundation

struct Point {
    var xCoordinate:Double = 0.0, yCoordinate:Double = 0.0
	
    init() {}
    
    init(x:Double, y:Double){
		self.xCoordinate = x
		self.yCoordinate = y
	}
    
    func toString() -> String{
        return "(x,y) = (\(xCoordinate),\(yCoordinate))"
    }
}

struct Point3 {
    var xCoordinate:Double = 0.0, yCoordinate:Double = 0.0, zCoordinate:Double = 0.0
	
	init() {}
    
    init(x:Double, y:Double, z:Double){
		self.xCoordinate = x
		self.yCoordinate = y
		self.zCoordinate = z
	}
    
    func toString() -> String{
        return "(x,y,z) = (\(xCoordinate),\(yCoordinate),\(zCoordinate))"
    }
}

func distanceBetweenPoints(a pointA:Point, b pointB:Point) -> Double{
	return sqrt((pointB.yCoordinate - pointA.yCoordinate) * (pointB.yCoordinate - pointA.yCoordinate) + (pointB.xCoordinate - pointA.xCoordinate) * (pointB.xCoordinate - pointA.xCoordinate))
}

func distanceBetweenPoints(a pointA:Point3, b pointB:Point3) -> Double{
    let b2 = (pointB.yCoordinate - pointA.yCoordinate) * (pointB.yCoordinate - pointA.yCoordinate)
    let a2 = (pointB.xCoordinate - pointA.xCoordinate) * (pointB.xCoordinate - pointA.xCoordinate)
    let c2 = (pointB.zCoordinate - pointA.zCoordinate) * (pointB.zCoordinate - pointA.zCoordinate)
	return sqrt(b2 + a2 + c2)
}

func midpointOfPoints(a aPoint:Point, b bPoint:Point) -> Point{
    let mid = Point(x: (bPoint.xCoordinate + aPoint.xCoordinate) / 2, y: (bPoint.yCoordinate + aPoint.yCoordinate) / 2)
    return mid
}

func midpointOfPoints(a aPoint:Point3, b bPoint:Point3) -> Point3{
    let mid = Point3(x: (bPoint.xCoordinate + aPoint.xCoordinate) / 2,
        y: (bPoint.yCoordinate + aPoint.yCoordinate) / 2,
        z: (bPoint.zCoordinate + aPoint.zCoordinate) / 2)
	return mid
}
//
//  Vector.swift
//  MathUtilities
//
//  Created by Allan Anderson on 07/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Cocoa

struct Vector {
    var magnitude:Double, direction:Double
    var xComponent:Double, yComponent:Double
    
    init(){
        self.magnitude = 0.0
        self.direction = 0.0
        self.xComponent = 0.0
        self.yComponent = 0.0
    }
    
    init(mag magnitude:Double, dir direction:Double){
        self.magnitude = magnitude
        self.direction = direction
        self.yComponent = magnitude * sin(direction)
        self.xComponent = magnitude * cos(direction)
    }
    
    init(x xComponent:Double, y yComponent:Double){
        self.xComponent = xComponent
        self.yComponent = yComponent
        self.magnitude = sqrt(xComponent * xComponent + yComponent * yComponent)
        self.direction = atan2(yComponent, xComponent)
    }
    
    func toString() -> String{
        return "\(magnitude) @ \(direction) radians\n[\(xComponent)   \(yComponent)]"
    }
}


struct Vector3 {
    var x:Double, y:Double, z:Double
    var magnitude:Double
    
    init(){
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.magnitude = 0.0
    }
    
    init(x inX:Double, y inY:Double, z inZ:Double){
        self.x = inX
        self.y = inY
        self.z = inZ
        self.magnitude = sqrt(inX * inX + inY * inY + inZ * inZ)
    }
}

struct Vector4 {
    var w:Double, x:Double, y:Double, z:Double
    var magnitude:Double
    
    init(){
        self.w = 1.0
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.magnitude = 0.0
    }
    
    init(x inX:Double, y inY:Double, z inZ:Double){
        self.w = 1.0
        self.x = inX
        self.y = inY
        self.z = inZ
        self.magnitude = sqrt(inX * inX + inY * inY + inZ * inZ)
    }
}

func addVector(a aVector:Vector, b bVector:Vector) -> Vector{
    let aPlusB = Vector(x: aVector.xComponent + bVector.xComponent, y: aVector.yComponent + bVector.yComponent)
    return aPlusB
}

func dotProduct(a aVector:Vector, b bVector:Vector) -> Double{
    return aVector.xComponent * bVector.xComponent + aVector.yComponent * bVector.yComponent
}

func addVector3(a aVector3:Vector3, b bVector3:Vector3) -> Vector3{
    let aPlusB = Vector3(x: aVector3.x + bVector3.x, y: aVector3.y + bVector3.y, z: aVector3.z + bVector3.z)
    return aPlusB
}

func normalizeVector(v aVector:Vector) -> Vector{
    let normalized = Vector(x: aVector.xComponent / aVector.magnitude, y: aVector.yComponent / aVector.magnitude)
    return normalized
}

func normalizeVector3(v aVector3:Vector3) -> Vector3{
    let normalized = Vector3(x: aVector3.x / aVector3.magnitude, y: aVector3.y / aVector3.magnitude, z: aVector3.z / aVector3.magnitude)
    return normalized
}

//
//  RightTriangle.swift
//  MathUtilities
//
//  Created by Allan Anderson on 13/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Foundation

enum TriangleType{
    case oppositeHypotenuse
    case adjacentHypotenuse
    case oppositeAdjacent
    case thetaHypotenuse
    case thetaOpposite
    case thetaAdjacent
    
    func toString() -> String{
        var typeString = ""
        switch self{
        case .oppositeHypotenuse:
            typeString = "Opposite & Hypotenuse"
        case .adjacentHypotenuse:
            typeString = "Adjacent & Hypotenuse"
        case .oppositeAdjacent:
            typeString = "Opposite & Adjacent"
        case .thetaAdjacent:
            typeString = "Adjacent & Theta"
        case .thetaOpposite:
            typeString = "Opposite & Theta"
        case .thetaHypotenuse:
            typeString = "Hypotenuse & Theta"
        }
        return typeString
    }
}

struct RightTriangle {
    var type:TriangleType
    var hyp: Double
    var opp: Double
    var adj: Double
    var theta: Double
    
    init(opposite:Double, adjacent:Double){
        opp = opposite
        adj = adjacent
        hyp = sqrt(opp * opp + adj * adj)
        theta = atan(opp / adj)
        type = TriangleType.oppositeAdjacent
    }
    
    init(opposite:Double, hypotenuse:Double){
        opp = opposite
        hyp = hypotenuse
        adj = sqrt(hyp * hyp - opp * opp)
        theta = asin(opp / hyp)
        type = TriangleType.oppositeHypotenuse
    }
    
    init(adjacent:Double, hypotenuse:Double){
        adj = adjacent
        hyp = hypotenuse
        opp = sqrt(hyp * hyp - adj * adj)
        theta = acos(adj / hyp)
        type = TriangleType.adjacentHypotenuse
    }
    
    init(theta:Double, hypotenuse:Double){
        self.theta = theta
        hyp = hypotenuse
        opp = sin(theta) * hyp
        adj = cos(theta) * hyp
        type = TriangleType.thetaHypotenuse
    }
    
    init(theta:Double, opposite:Double){
        self.theta = theta
        opp = opposite
        hyp = opp / sin(theta)
        adj = opp / tan(theta)
        type = TriangleType.thetaOpposite
    }
    
    init(theta:Double, adjacent:Double){
        self.theta = theta
        adj = adjacent
        opp = adj * tan(theta)
        hyp = adj / cos(theta)
        type = TriangleType.thetaAdjacent
    }
	
	func toString() -> String{
		return "Adj = \(adj), Opp = \(opp), Hyp = \(hyp), θ = \(theta) radians, Type = \(type.toString())"
	}
}

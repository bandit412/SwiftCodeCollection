//
//  Math.swift
//  MathUtilities
//
//  Created by Allan Anderson on 07/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Cocoa

/*
Some basic math functions
*/
func greatestCommonDenominator (_ numerator:Double, denominator:Double) -> Double{
    if denominator != 0{
        if numerator.truncatingRemainder(dividingBy: denominator) == 0{
            return denominator
        } else {
            return greatestCommonDenominator(denominator, denominator: numerator.truncatingRemainder(dividingBy: denominator))
        }
    } else {
        return Double.infinity
    }
}

func toDegrees (_ radians:Double) -> Double{
    return radians * 180 / .pi
}

func toRadians (_ degrees:Double) -> Double{
    return degrees * .pi / 180
}

func quadraticPositive(_ a:Double, b:Double, c:Double) -> Double{
    let b2 = b * b
    let ac4 = 4 * a * c
    let a2 = 2 * a
    let root = b2 - ac4
    return (-1 * b + sqrt(root)) / a2
}

func quadraticNegative(_ a:Double, b:Double, c:Double) -> Double{
    let b2 = b * b
    let ac4 = 4 * a * c
    let a2 = 2 * a
    let root = b2 - ac4
    return (-1 * b - sqrt(root)) / a2
}

func createArray(_ rows:Int, columns:Int) -> [[Double]]{
    var array2D = Array<Array<Double>>()
    for _ in 0...rows - 1 {
        array2D.append(Array(repeating: Double(), count: columns))
    }
    for row in 0...rows - 1{
        for _col in 0...columns - 1{
            array2D[row][_col] = 0.0
        }
    }
    return array2D
}




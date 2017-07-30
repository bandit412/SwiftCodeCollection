//
//  main.swift
//  MathUtilities
//
//  Created by Allan Anderson on 07/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Foundation


/*
CONSTANTS
*/
let gravity = -9.81

/*
Testing of the functions
*/
var numerator:Double = 26
var denominator:Double = 4
print("The GCD of \(numerator) and \(denominator) is \(greatestCommonDenominator(numerator, denominator: denominator))")
print()

var angle = 30.0
let radians = toRadians(angle)
let degrees = toDegrees(radians)
print("Angle of \(angle)° = \(radians) radians = \(degrees)°")
print()

var b = 5.0
var c = 8.0
print("The positive quadratic root is \(quadraticPositive(gravity / 2, b: b, c: c))")
print("The negative quadratic root is \(quadraticNegative(gravity / 2, b: b, c: c))")
print()
var array2D = createArray(4, columns: 3)
print("Array: \(array2D)")
print()

// try using classes
let someVector = Vector(mag: 10, dir: toRadians(30))
print("someVector:")
print("X = \(someVector.xComponent) and Y = \(someVector.yComponent)")
print(someVector.toString())
let anotherVector = Vector(x: someVector.xComponent, y: someVector.yComponent)
print("anotherVector:")
print("Mag = \(anotherVector.magnitude) and Dir = \(toDegrees(anotherVector.direction))")
print(anotherVector.toString())
print()

let vec3D = Vector3(x: 3, y: 4, z: 5)
print("Vector3: Magnitude = \(vec3D.magnitude)")
print()

let vecA = Vector(x: 3, y: 4)
let vecB = Vector(mag: 5, dir: toRadians(20))
let vecC = addVector(a: vecA, b: vecB)
print("A + B = (\(vecC.xComponent), \(vecC.yComponent)) OR: \(vecC.magnitude) @ \(toDegrees(vecC.direction))")
print("A ⋅ B = \(dotProduct(a: vecA, b: vecB))")
print()

let normal2 = normalizeVector(v: vecB)
let normal3 = normalizeVector3(v: vec3D)
print("|vecB| = [\(normal2.xComponent)   \(normal2.yComponent)] Mag: \(normal2.magnitude)")
print("|vec3D| = [\(normal3.x)    \(normal3.y)    \(normal3.z)] Mag: \(normal3.magnitude)")
print()

var m4 = Matrix4()
m4.createIdentity()
print("⎡\(m4.m00)  \(m4.m01)  \(m4.m02)  \(m4.m03)⎤")
print("|\(m4.m10)  \(m4.m11)  \(m4.m12)  \(m4.m13)|")
print("|\(m4.m20)  \(m4.m21)  \(m4.m22)  \(m4.m23)|")
print("⎣\(m4.m30)  \(m4.m31)  \(m4.m32)  \(m4.m33)⎦")
print()
m4 = addMatrices4(a: m4, b: m4)
print("⎡\(m4.m00)  \(m4.m01)  \(m4.m02)  \(m4.m03)⎤")
print("|\(m4.m10)  \(m4.m11)  \(m4.m12)  \(m4.m13)|")
print("|\(m4.m20)  \(m4.m21)  \(m4.m22)  \(m4.m23)|")
print("⎣\(m4.m30)  \(m4.m31)  \(m4.m32)  \(m4.m33)⎦")
print()

m4 = multiplyMatrix(m4, by: m4)
print("⎡\(m4.m00)  \(m4.m01)  \(m4.m02)  \(m4.m03)⎤")
print("|\(m4.m10)  \(m4.m11)  \(m4.m12)  \(m4.m13)|")
print("|\(m4.m20)  \(m4.m21)  \(m4.m22)  \(m4.m23)|")
print("⎣\(m4.m30)  \(m4.m31)  \(m4.m32)  \(m4.m33)⎦")
print()

let m4I = invMatrix(matrix4: m4)
let m4_m4I = multiplyMatrix(m4, by: m4I)
print("Inverse")
print("⎡\(m4I.m00)  \(m4I.m01)  \(m4I.m02)  \(m4I.m03)⎤")
print("|\(m4I.m10)  \(m4I.m11)  \(m4I.m12)  \(m4I.m13)|")
print("|\(m4I.m20)  \(m4I.m21)  \(m4I.m22)  \(m4I.m23)|")
print("⎣\(m4I.m30)  \(m4I.m31)  \(m4I.m32)  \(m4I.m33)⎦")
print("Identity")
print("⎡\(m4_m4I.m00)  \(m4_m4I.m01)  \(m4_m4I.m02)  \(m4_m4I.m03)⎤")
print("|\(m4_m4I.m10)  \(m4_m4I.m11)  \(m4_m4I.m12)  \(m4_m4I.m13)|")
print("|\(m4_m4I.m20)  \(m4_m4I.m21)  \(m4_m4I.m22)  \(m4_m4I.m23)|")
print("⎣\(m4_m4I.m30)  \(m4_m4I.m31)  \(m4_m4I.m32)  \(m4_m4I.m33)⎦")
print()

var matrix2 = Matrix2()
matrix2.m00 = 1.5
matrix2.m11 = -2.5
let invM2 = invMatrix(matrix2: matrix2)
print("⎡\(invM2.m00)  \(invM2.m01)⎤")
print("⎣\(invM2.m10)  \(invM2.m11)⎦")
print()

let aTimesB = multiplyMatrix(matrix2, by: invM2)
print("⎡\(aTimesB.m00)  \(aTimesB.m01)⎤")
print("⎣\(aTimesB.m10)  \(aTimesB.m11)⎦")
print()

var m3 = Matrix3()
m3.m00 = 1.5
m3.m02 = 2.0
m3.m11 = 1.0
m3.m12 = -3.0
m3.m22 = 1.0
let m3I = invMatrix(matrix3: m3)
let m3_m3I = multiplyMatrix(m3, by: m3I)
print("⎡\(m3.m00)  \(m3.m01)  \(m3.m02)⎤")
print("|\(m3.m10)  \(m3.m11)  \(m3.m12)|")
print("⎣\(m3.m20)  \(m3.m21)  \(m3.m22)⎦")
print()
print("Inverse")
print("⎡\(m3I.m00)  \(m3I.m01)  \(m3I.m02)⎤")
print("|\(m3I.m10)  \(m3I.m11)  \(m3I.m12)|")
print("⎣\(m3I.m20)  \(m3I.m21)  \(m3I.m22)⎦")
print("Identity")
print("⎡\(m3_m3I.m00)  \(m3_m3I.m01)  \(m3_m3I.m02)⎤")
print("|\(m3_m3I.m10)  \(m3_m3I.m11)  \(m3_m3I.m12)|")
print("⎣\(m3_m3I.m20)  \(m3_m3I.m21)  \(m3_m3I.m22)⎦")
print()

var p2 = Matrix13()
p2.m00 = 3
p2.m10 = -3
p2.m20 = 1

var scale:Point = Point()
var shift:Point = Point()
scale.xCoordinate = 2.0
scale.yCoordinate = -2.0
shift.xCoordinate = 1.5
shift.yCoordinate = -1.5
var transform = Matrix3(scale: scale, by: shift)

let newPoint = multiplyMatrix(transform, by: p2)
print("Transform Matrix")
print("⎡\(transform.m00)  \(transform.m01)  \(transform.m02)⎤")
print("|\(transform.m10)  \(transform.m11)  \(transform.m12)|")
print("⎣\(transform.m20)  \(transform.m21)  \(transform.m22)⎦")
print()
print("⎡\(newPoint.m00)⎤")
print("|\(newPoint.m10)|")
print("⎣\(newPoint.m20)⎦")
print()

let t1 = RightTriangle(opposite: 3, adjacent: 4)
print(t1.toString())
let t2 = RightTriangle(theta: t1.theta, hypotenuse: t1.hyp)
print(t2.toString())
let t3 = RightTriangle(theta: t2.theta, opposite: t2.opp)
print(t3.toString())
let t4 = RightTriangle(opposite: t3.opp, hypotenuse: t3.hyp)
print(t4.toString())
let t5 = RightTriangle(theta: t4.theta, adjacent: t4.adj)
print(t5.toString())
let t6 = RightTriangle(adjacent: t5.adj, hypotenuse: t5.hyp)
print(t6.toString())
print()

let line1 = Line(slope: 3, yIntercept: 2)
let pA = Point(x: 3, y: 2)
let pB = Point(x: 5, y: -8)
let line2 = Line(aPoint: pA, and: pB)
print(line1.toString())
print(line2.toString())
print("Solve for intersection:")
let intersectionPoint = SolveLine(line1, lineB: line2)
print(intersectionPoint.toString())
print()

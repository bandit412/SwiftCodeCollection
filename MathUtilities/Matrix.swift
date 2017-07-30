//
//  Matrix.swift
//  MathUtilities
//
//  Created by Allan Anderson on 07/11/2014.
//  Copyright (c) 2014 Allan Anderson. All rights reserved.
//

import Foundation

struct Matrix {
    var rows:Int
    var cols:Int
    
    init(rows inRows:Int, cols inCols:Int){
        self.rows = inRows
        self.cols = inCols
        // create the Matrix as a [[Double]]
        var matrix = Array<Array<Double>>()
        for _ in 0...self.rows - 1 {
            matrix.append(Array(repeating: Double(), count: self.cols))
        }
    }
}

struct Matrix2{
    var m00:Double = 0.0, m01:Double = 0.0
    var m10:Double = 0.0, m11:Double = 0.0
    
    init(){}
    
    mutating func createIdentity(){
        m00 = 1.0
        m11 = 1.0
    }
}

struct Matrix3{
    var m00:Double = 0.0, m01:Double = 0.0, m02:Double = 0.0
    var m10:Double = 0.0, m11:Double = 0.0, m12:Double = 0.0
    var m20:Double = 0.0, m21:Double = 0.0, m22:Double = 0.0
    
    init(){}
    
    init(scale s:Point, by shift:Point){
        m00 = scale.xCoordinate
        m01 = 0.0
        m02 = shift.xCoordinate
        m10 = 0.0
        m11 = scale.yCoordinate
        m12 = shift.yCoordinate
        m20 = 0.0
        m21 = 0.0
        m22 = 1.0
    }
    
    mutating func createIdentity(){
        m00 = 1.0
        m01 = 0.0
        m02 = 0.0
        m10 = 0.0
        m11 = 1.0
        m12 = 0.0
        m20 = 0.0
        m21 = 0.0
        m22 = 1.0
    }
    
    mutating func create2DRotation(angle r:Double, point p:Point3){
        let cosine = cos(r)
        let sine = sin(r)
        m00 = cosine
        m01 = -1 * sine
        m02 = p.xCoordinate - p.xCoordinate * cosine + p.yCoordinate * sine
        m10 = -1 * m01
        m11 = m00
        m12 = p.yCoordinate - p.xCoordinate * sine - p.yCoordinate * cosine
        m20 = 0.0
        m21 = 0.0
        m22 = 1.0
    }
}

struct Matrix4 {
    var m00:Double = 0.0, m01:Double = 0.0, m02:Double = 0.0, m03:Double = 0.0
    var m10:Double = 0.0, m11:Double = 0.0, m12:Double = 0.0, m13:Double = 0.0
    var m20:Double = 0.0, m21:Double = 0.0, m22:Double = 0.0, m23:Double = 0.0
    var m30:Double = 0.0, m31:Double = 0.0, m32:Double = 0.0, m33:Double = 0.0
    
    init(){}
    
    init(scale:Point3, by shift:Point3){
        m00 = scale.xCoordinate
        m01 = 0.0
        m02 = 0.0
        m03 = shift.xCoordinate
        m10 = 0.0
        m11 = scale.yCoordinate
        m12 = 0.0
        m13 = shift.yCoordinate
        m20 = 0.0
        m21 = 0.0
        m22 = scale.zCoordinate
        m23 = shift.zCoordinate
        m30 = 0.0
        m31 = 0.0
        m32 = 0.0
        m33 = 1.0
    }
    
    mutating func createIdentity(){
        m00 = 1.0
        m01 = 0.0
        m02 = 0.0
        m03 = 0.0
        m10 = 0.0
        m11 = 1.0
        m12 = 0.0
        m13 = 0.0
        m20 = 0.0
        m21 = 0.0
        m22 = 1.0
        m23 = 0.0
        m30 = 0.0
        m31 = 0.0
        m32 = 0.0
        m33 = 1.0
    }
}

struct Matrix13{
    var m00 = 0.0
    var m10 = 0.0
    var m20 = 1.0
	
    init() {}
    
    init(p point2:Point){
		m00 = point2.xCoordinate
		m10 = point2.yCoordinate
		m20 = 1.0
	}
}
struct Matrix14{
    var m00 = 0.0
    var m10 = 0.0
    var m20 = 0.0
    var m30 = 1.0
	
    init() {}
    
    init(p point3:Point3){
		m00 = point3.xCoordinate
		m10 = point3.yCoordinate
		m20 = point3.zCoordinate
		m30 = 1.0
	}
}

func addMatrices2(a aMatrix:Matrix2, b bMatrix:Matrix2) -> Matrix2{
	var aPlusB:Matrix2 = Matrix2()
	aPlusB.m00 = aMatrix.m00 + bMatrix.m00
	aPlusB.m01 = aMatrix.m01 + bMatrix.m01
	aPlusB.m10 = aMatrix.m10 + bMatrix.m10
	aPlusB.m11 = aMatrix.m11 + bMatrix.m11
    return aPlusB
}

func addMatrices3(a aMatrix:Matrix3, b bMatrix:Matrix3) -> Matrix3{
    var aPlusB:Matrix3 = Matrix3()
    aPlusB.m00 = aMatrix.m00 + bMatrix.m00
    aPlusB.m01 = aMatrix.m01 + bMatrix.m01
    aPlusB.m02 = aMatrix.m02 + bMatrix.m02
    aPlusB.m10 = aMatrix.m10 + bMatrix.m10
    aPlusB.m11 = aMatrix.m11 + bMatrix.m11
    aPlusB.m12 = aMatrix.m12 + bMatrix.m12
    aPlusB.m20 = aMatrix.m20 + bMatrix.m20
    aPlusB.m21 = aMatrix.m21 + bMatrix.m21
    aPlusB.m22 = aMatrix.m22 + bMatrix.m22
    return aPlusB
}

func addMatrices4(a aMatrix:Matrix4, b bMatrix:Matrix4) -> Matrix4{
    var aPlusB:Matrix4 = Matrix4()
    aPlusB.m00 = aMatrix.m00 + bMatrix.m00
    aPlusB.m01 = aMatrix.m01 + bMatrix.m01
    aPlusB.m02 = aMatrix.m02 + bMatrix.m02
    aPlusB.m03 = aMatrix.m03 + bMatrix.m03
    aPlusB.m10 = aMatrix.m10 + bMatrix.m10
    aPlusB.m11 = aMatrix.m11 + bMatrix.m11
    aPlusB.m12 = aMatrix.m12 + bMatrix.m12
    aPlusB.m13 = aMatrix.m13 + bMatrix.m13
    aPlusB.m20 = aMatrix.m20 + bMatrix.m20
    aPlusB.m21 = aMatrix.m21 + bMatrix.m21
    aPlusB.m22 = aMatrix.m22 + bMatrix.m22
    aPlusB.m23 = aMatrix.m23 + bMatrix.m23
    aPlusB.m30 = aMatrix.m30 + bMatrix.m30
    aPlusB.m31 = aMatrix.m31 + bMatrix.m31
    aPlusB.m32 = aMatrix.m32 + bMatrix.m32
    aPlusB.m33 = aMatrix.m33 + bMatrix.m33
    return aPlusB
}

func multiplyMatrix(_ a:Matrix2, by b:Matrix2) ->Matrix2{
    var aTimesB = Matrix2()
    aTimesB.m00 = a.m00 * b.m00 + a.m01 * b.m10
    aTimesB.m01 = a.m00 * b.m10 + a.m01 * b.m11
    aTimesB.m10 = a.m10 * b.m00 + a.m11 * b.m10
    aTimesB.m11 = a.m10 * b.m10 + a.m11 * b.m11
    return aTimesB
}

func multiplyMatrix(_ a:Matrix3, by b:Matrix3) ->Matrix3{
    var aTimesB = Matrix3()
    aTimesB.m00 = a.m00 * b.m00 + a.m01 * b.m10 + a.m02 * b.m20
    aTimesB.m01 = a.m00 * b.m01 + a.m01 * b.m11 + a.m02 * b.m21
    aTimesB.m02 = a.m00 * b.m02 + a.m01 * b.m12 + a.m02 * b.m22
    aTimesB.m10 = a.m10 * b.m00 + a.m11 * b.m10 + a.m12 * b.m20
    aTimesB.m11 = a.m10 * b.m01 + a.m11 * b.m11 + a.m12 * b.m21
    aTimesB.m12 = a.m10 * b.m02 + a.m11 * b.m12 + a.m12 * b.m22
    aTimesB.m20 = a.m20 * b.m00 + a.m21 * b.m10 + a.m22 * b.m20
    aTimesB.m21 = a.m20 * b.m01 + a.m21 * b.m11 + a.m22 * b.m21
    aTimesB.m22 = a.m20 * b.m02 + a.m21 * b.m12 + a.m22 * b.m22
    return aTimesB
}

func multiplyMatrix(_ a:Matrix4, by b:Matrix4) ->Matrix4{
    var aTimesB = Matrix4()
    aTimesB.m00 = a.m00 * b.m00 + a.m01 * b.m10 + a.m02 * b.m20 + a.m03 * b.m30
    aTimesB.m01 = a.m00 * b.m01 + a.m01 * b.m11 + a.m02 * b.m21 + a.m03 * b.m31
    aTimesB.m02 = a.m00 * b.m02 + a.m01 * b.m12 + a.m02 * b.m22 + a.m03 * b.m32
    aTimesB.m03 = a.m00 * b.m03 + a.m01 * b.m13 + a.m02 * b.m23 + a.m03 * b.m33
    aTimesB.m10 = a.m10 * b.m00 + a.m11 * b.m10 + a.m12 * b.m20 + a.m13 * b.m30
    aTimesB.m11 = a.m10 * b.m01 + a.m11 * b.m11 + a.m12 * b.m21 + a.m13 * b.m31
    aTimesB.m12 = a.m10 * b.m02 + a.m11 * b.m12 + a.m12 * b.m22 + a.m13 * b.m32
    aTimesB.m13 = a.m10 * b.m03 + a.m11 * b.m13 + a.m12 * b.m23 + a.m13 * b.m33
    aTimesB.m20 = a.m20 * b.m00 + a.m21 * b.m10 + a.m22 * b.m20 + a.m23 * b.m30
    aTimesB.m21 = a.m20 * b.m01 + a.m21 * b.m11 + a.m22 * b.m21 + a.m23 * b.m31
    aTimesB.m22 = a.m20 * b.m02 + a.m21 * b.m12 + a.m22 * b.m22 + a.m23 * b.m32
    aTimesB.m23 = a.m20 * b.m03 + a.m21 * b.m13 + a.m22 * b.m23 + a.m23 * b.m33
    aTimesB.m30 = a.m30 * b.m00 + a.m31 * b.m10 + a.m32 * b.m20 + a.m33 * b.m30
    aTimesB.m31 = a.m30 * b.m01 + a.m31 * b.m11 + a.m32 * b.m21 + a.m33 * b.m31
    aTimesB.m32 = a.m30 * b.m02 + a.m31 * b.m12 + a.m32 * b.m22 + a.m33 * b.m32
    aTimesB.m33 = a.m30 * b.m03 + a.m31 * b.m13 + a.m32 * b.m23 + a.m33 * b.m33
    return aTimesB
}


func multiplyMatrix(_ a:Matrix3, by b:Matrix13) ->Matrix13{
    var aTimesB = Matrix13()
    aTimesB.m00 = a.m00 * b.m00 + a.m01 * b.m10 + a.m02 * b.m20
    aTimesB.m10 = a.m10 * b.m00 + a.m11 * b.m10 + a.m12 * b.m20
    aTimesB.m20 = a.m20 * b.m00 + a.m21 * b.m10 + a.m22 * b.m20
    return aTimesB
}

func multiplyMatrix(_ a:Matrix4, by b:Matrix14) ->Matrix14{
    var aTimesB = Matrix14()
    aTimesB.m00 = a.m00 * b.m00 + a.m01 * b.m10 + a.m02 * b.m20 + a.m03 * b.m30
    aTimesB.m10 = a.m10 * b.m00 + a.m11 * b.m10 + a.m12 * b.m20 + a.m13 * b.m30
    aTimesB.m20 = a.m20 * b.m00 + a.m21 * b.m10 + a.m22 * b.m20 + a.m23 * b.m30
    aTimesB.m30 = a.m30 * b.m00 + a.m31 * b.m10 + a.m32 * b.m20 + a.m33 * b.m30
    return aTimesB
}

func detMatrix(matrix2 a:Matrix2) -> Double{
    return a.m00 * a.m11 - a.m01 * a.m10
}

func detMatrix(matrix3 a:Matrix3) -> Double{
    var da1 = Matrix2()
    var da2 = Matrix2()
    var da3 = Matrix2()
    // assign values
    //da1
    da1.m00 = a.m11
    da1.m01 = a.m12
    da1.m10 = a.m21
    da1.m11 = a.m22
    //da2
    da2.m00 = a.m10
    da2.m01 = a.m12
    da2.m10 = a.m20
    da2.m11 = a.m22
    //da3
    da3.m00 = a.m10
    da3.m01 = a.m11
    da3.m10 = a.m20
    da3.m11 = a.m21
    return a.m00 * detMatrix(matrix2: da1) - a.m01 * detMatrix(matrix2: da2) + a.m02 * detMatrix(matrix2: da3)
}

func detMatrix(matrix4 a:Matrix4) -> Double{
    var da1 = Matrix3()
    var da2 = Matrix3()
    var da3 = Matrix3()
    var da4 = Matrix3()
    // assign values
    //da1
    da1.m00 = a.m11
    da1.m01 = a.m12
    da1.m02 = a.m13
    da1.m10 = a.m21
    da1.m11 = a.m22
    da1.m12 = a.m23
    da1.m20 = a.m31
    da1.m21 = a.m32
    da1.m22 = a.m33
    //da2
    da2.m00 = a.m10
    da2.m01 = a.m12
    da2.m02 = a.m13
    da2.m10 = a.m20
    da2.m01 = a.m22
    da2.m02 = a.m23
    da2.m20 = a.m30
    da2.m21 = a.m32
    da2.m22 = a.m33
    //da3
    da3.m00 = a.m10
    da3.m01 = a.m11
    da3.m02 = a.m13
    da3.m10 = a.m20
    da3.m11 = a.m21
    da3.m12 = a.m23
    da3.m20 = a.m30
    da3.m21 = a.m31
    da3.m22 = a.m33
    //da4
    da4.m00 = a.m10
    da4.m01 = a.m11
    da4.m02 = a.m12
    da4.m10 = a.m20
    da4.m11 = a.m21
    da4.m12 = a.m22
    da4.m20 = a.m30
    da4.m21 = a.m31
    da4.m22 = a.m32
    // calculate determinant
    return a.m00 * detMatrix(matrix3: da1) - a.m01 * detMatrix(matrix3: da2) + a.m02 * detMatrix(matrix3: da3) - a.m03 * detMatrix(matrix3: da4)
}

func invMatrix(matrix2 a:Matrix2) -> Matrix2{
    var inverse = Matrix2()
    let det = detMatrix(matrix2: a)
    inverse.m00 = a.m11 / det
    inverse.m01 = -1 * a.m01 / det
    inverse.m10 = -1 * a.m10 / det
    inverse.m11 = a.m00 / det
    return inverse
}

func invMatrix(matrix3 a:Matrix3) -> Matrix3{
    var inverse = Matrix3()
    // cofactor matrices
    var c00 = Matrix2()
    var c01 = Matrix2()
    var c02 = Matrix2()
    var c10 = Matrix2()
    var c11 = Matrix2()
    var c12 = Matrix2()
    var c20 = Matrix2()
    var c21 = Matrix2()
    var c22 = Matrix2()
    // cofactor matrix
    var cof = Matrix3()
    let det = detMatrix(matrix3: a)
    //1. setup cofactor array using determinants
    c00.m00 = a.m11
    c00.m01 = a.m12
    c00.m10 = a.m21
    c00.m11 = a.m22
    c01.m00 = a.m10
    c01.m01 = a.m12
    c01.m10 = a.m20
    c01.m11 = a.m22
    c02.m00 = a.m10
    c02.m01 = a.m11
    c02.m10 = a.m20
    c02.m11 = a.m21
    c10.m00 = a.m01
    c10.m01 = a.m02
    c10.m10 = a.m21
    c10.m11 = a.m22
    c11.m00 = a.m00
    c11.m01 = a.m02
    c11.m10 = a.m20
    c11.m11 = a.m22
    c12.m00 = a.m00
    c12.m01 = a.m01
    c12.m10 = a.m20
    c12.m11 = a.m21
    c20.m00 = a.m01
    c20.m01 = a.m02
    c20.m10 = a.m11
    c20.m11 = a.m12
    c21.m00 = a.m00
    c21.m01 = a.m02
    c21.m10 = a.m10
    c21.m11 = a.m12
    c22.m00 = a.m00
    c22.m01 = a.m01
    c22.m10 = a.m10
    c22.m11 = a.m11
    cof.m00 = detMatrix(matrix2: c00)
    cof.m01 = detMatrix(matrix2: c01) * -1
    cof.m02 = detMatrix(matrix2: c02)
    cof.m10 = detMatrix(matrix2: c10) * -1
    cof.m11 = detMatrix(matrix2: c11)
    cof.m12 = detMatrix(matrix2: c12) * -1
    cof.m20 = detMatrix(matrix2: c20)
    cof.m21 = detMatrix(matrix2: c21) * -1
    cof.m22 = detMatrix(matrix2: c22)
    //2. transpose the cofactor matrix  & divide by the determinant
    inverse.m00 = cof.m00 / det
    inverse.m01 = cof.m10 / det
    inverse.m02 = cof.m20 / det
    inverse.m10 = cof.m01 / det
    inverse.m11 = cof.m11 / det
    inverse.m12 = cof.m21 / det
    inverse.m20 = cof.m02 / det
    inverse.m21 = cof.m12 / det
    inverse.m22 = cof.m22 / det
    // return
    return inverse
}

func invMatrix(matrix4 a:Matrix4) -> Matrix4{
    var inverse = Matrix4()
    // cofactor matrices
    var c00 = Matrix3()
    var c01 = Matrix3()
    var c02 = Matrix3()
    var c03 = Matrix3()
    var c10 = Matrix3()
    var c11 = Matrix3()
    var c12 = Matrix3()
    var c13 = Matrix3()
    var c20 = Matrix3()
    var c21 = Matrix3()
    var c22 = Matrix3()
    var c23 = Matrix3()
    var c30 = Matrix3()
    var c31 = Matrix3()
    var c32 = Matrix3()
    var c33 = Matrix3()
    // cofactor matrix
    var cof = Matrix4()
    let det = detMatrix(matrix4: a)
    //1. setup cofactor array using determinants
    c00.m00 = a.m11
    c00.m01 = a.m12
    c00.m02 = a.m13
    c00.m10 = a.m21
    c00.m11 = a.m22
    c00.m12 = a.m23
    c00.m20 = a.m31
    c00.m21 = a.m32
    c00.m22 = a.m33
    c01.m00 = a.m10
    c01.m01 = a.m12
    c01.m02 = a.m13
    c01.m10 = a.m20
    c01.m11 = a.m22
    c01.m12 = a.m23
    c01.m20 = a.m30
    c01.m21 = a.m32
    c01.m22 = a.m33
    c02.m00 = a.m10
    c02.m01 = a.m11
    c02.m02 = a.m13
    c02.m10 = a.m20
    c02.m11 = a.m21
    c02.m12 = a.m23
    c02.m20 = a.m30
    c02.m21 = a.m31
    c02.m22 = a.m33
    c03.m00 = a.m10
    c03.m01 = a.m11
    c03.m02 = a.m12
    c03.m10 = a.m20
    c03.m11 = a.m21
    c03.m12 = a.m22
    c03.m20 = a.m30
    c03.m21 = a.m31
    c03.m22 = a.m32
    c10.m00 = a.m01
    c10.m01 = a.m02
    c10.m02 = a.m03
    c10.m10 = a.m21
    c10.m11 = a.m22
    c10.m12 = a.m23
    c10.m20 = a.m31
    c10.m21 = a.m32
    c10.m22 = a.m33
    c11.m00 = a.m00
    c11.m01 = a.m02
    c11.m02 = a.m03
    c11.m10 = a.m20
    c11.m11 = a.m22
    c11.m12 = a.m23
    c11.m20 = a.m30
    c11.m21 = a.m32
    c11.m22 = a.m33
    c12.m00 = a.m00
    c12.m01 = a.m01
    c12.m02 = a.m03
    c12.m10 = a.m20
    c12.m11 = a.m21
    c12.m12 = a.m23
    c12.m20 = a.m30
    c12.m21 = a.m31
    c12.m22 = a.m33
    c13.m00 = a.m00
    c13.m01 = a.m01
    c13.m02 = a.m02
    c13.m10 = a.m20
    c13.m11 = a.m21
    c13.m12 = a.m22
    c13.m20 = a.m30
    c13.m21 = a.m31
    c13.m22 = a.m32
    c20.m00 = a.m01
    c20.m01 = a.m02
    c20.m02 = a.m03
    c20.m10 = a.m11
    c20.m11 = a.m12
    c20.m12 = a.m13
    c20.m20 = a.m31
    c20.m21 = a.m32
    c20.m22 = a.m33
    c21.m00 = a.m00
    c21.m01 = a.m02
    c21.m02 = a.m03
    c21.m10 = a.m10
    c21.m11 = a.m12
    c21.m12 = a.m13
    c21.m20 = a.m30
    c21.m21 = a.m32
    c21.m22 = a.m33
    c22.m00 = a.m00
    c22.m01 = a.m01
    c22.m02 = a.m03
    c22.m10 = a.m10
    c22.m11 = a.m11
    c22.m12 = a.m13
    c22.m20 = a.m30
    c22.m21 = a.m31
    c22.m22 = a.m33
    c23.m00 = a.m00
    c23.m01 = a.m01
    c23.m02 = a.m02
    c23.m10 = a.m10
    c23.m11 = a.m11
    c23.m12 = a.m12
    c23.m20 = a.m30
    c23.m21 = a.m31
    c23.m22 = a.m32
    c30.m00 = a.m01
    c30.m01 = a.m02
    c30.m02 = a.m03
    c30.m10 = a.m11
    c30.m11 = a.m12
    c30.m12 = a.m13
    c30.m20 = a.m21
    c30.m21 = a.m22
    c30.m22 = a.m23
    c31.m00 = a.m00
    c31.m01 = a.m02
    c31.m02 = a.m03
    c31.m10 = a.m10
    c31.m11 = a.m12
    c31.m12 = a.m13
    c31.m20 = a.m20
    c31.m21 = a.m22
    c31.m22 = a.m23
    c32.m00 = a.m00
    c32.m01 = a.m01
    c32.m02 = a.m03
    c32.m10 = a.m10
    c32.m11 = a.m11
    c32.m12 = a.m13
    c32.m20 = a.m20
    c32.m21 = a.m21
    c32.m22 = a.m23
    c33.m00 = a.m00
    c33.m01 = a.m01
    c33.m02 = a.m02
    c33.m10 = a.m10
    c33.m11 = a.m11
    c33.m12 = a.m12
    c33.m20 = a.m20
    c33.m21 = a.m21
    c33.m22 = a.m22
    cof.m00 = detMatrix(matrix3: c00)
    cof.m01 = detMatrix(matrix3: c01) * -1
    cof.m02 = detMatrix(matrix3: c02)
    cof.m03 = detMatrix(matrix3: c03) * -1
    cof.m10 = detMatrix(matrix3: c10) * -1
    cof.m11 = detMatrix(matrix3: c11)
    cof.m12 = detMatrix(matrix3: c12) * -1
    cof.m13 = detMatrix(matrix3: c13)
    cof.m20 = detMatrix(matrix3: c20)
    cof.m21 = detMatrix(matrix3: c21) * -1
    cof.m22 = detMatrix(matrix3: c22)
    cof.m23 = detMatrix(matrix3: c23) * -1
    cof.m30 = detMatrix(matrix3: c30) * -1
    cof.m31 = detMatrix(matrix3: c31)
    cof.m32 = detMatrix(matrix3: c32) * -1
    cof.m33 = detMatrix(matrix3: c33)
    //2. transpose the cofactor matrix  & divide by the determinant
    inverse.m00 = cof.m00 / det
    inverse.m01 = cof.m10 / det
    inverse.m02 = cof.m20 / det
    inverse.m03 = cof.m30 / det
    inverse.m10 = cof.m01 / det
    inverse.m11 = cof.m11 / det
    inverse.m12 = cof.m21 / det
    inverse.m13 = cof.m31 / det
    inverse.m20 = cof.m02 / det
    inverse.m21 = cof.m12 / det
    inverse.m22 = cof.m22 / det
    inverse.m23 = cof.m32 / det
    inverse.m30 = cof.m03 / det
    inverse.m31 = cof.m13 / det
    inverse.m32 = cof.m23 / det
    inverse.m33 = cof.m33 / det
    // return
    return inverse
}

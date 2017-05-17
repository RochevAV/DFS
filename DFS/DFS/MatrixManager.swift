//
//  MatrixManager.swift
//  DFS
//
//  Created by Aleksey Rochev on 17/05/2017.
//  Copyright © 2017 AlekseyRochev. All rights reserved.
//

import Foundation

class MatrixManager {
    
    fileprivate let matrixDefault = "0 1 0 0 1 0\n1 0 1 0 1 0\n0 1 0 1 0 0\n0 0 1 0 1 1\n1 1 0 1 0 0\n0 0 0 1 0 0"
    let matrix : [[Bool]]
    
    init() {
        
        matrix = MatrixManager.matrixFromString(matrixDefault)
    }
    
    private static func matrixFromString(_ string: String) -> [[Bool]] {
        
        let array = string.components(separatedBy: CharacterSet.newlines)

        let lenght = array.count
        let clearArray = Array(repeatElement(false, count: lenght))
        var returnArray = Array(repeatElement(clearArray, count: lenght))
        
        for (indexX, line) in array.enumerated() {
            
            let items = line.components(separatedBy: CharacterSet.whitespaces)
            
            for (indexY, value) in items.enumerated() {
                
                if let value = value.toBool() {
                    returnArray[indexX][indexY] = value
                }
            }
        }
        
        return returnArray
    }
    
    func getExtensibleNodesForNode(_ nodeNum: Int) -> [Bool] {
        return self.getUsedNodesForNode(nodeNum, matrix: matrix)
    }
    
    func getUsedNodesForNode(_ nodeNum: Int, matrix: [[Bool]]) -> [Bool] {
    
        let lenght = matrix.count
        var usedItems = Array(repeatElement(false, count: lenght))
        
        self.dfsForNode(nodeNum, usedNodes: &usedItems, matrix: matrix)
        
        return usedItems;
    }
    
    
    fileprivate func dfsForNode(_ nodeNum: Int, usedNodes: inout [Bool], matrix: [[Bool]]) {
        
        usedNodes[nodeNum] = true
        let count = matrix.count - 1
        
        for index in 0...count {
            if !usedNodes[index] && matrix[nodeNum][index] {
                self.dfsForNode(index, usedNodes: &usedNodes, matrix: matrix)
            }
        }
    }
    
    
    
}

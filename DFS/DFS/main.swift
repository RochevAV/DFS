//
//  main.swift
//  DFS
//
//  Created by Aleksey Rochev on 17/05/2017.
//  Copyright © 2017 AlekseyRochev. All rights reserved.
//

import Foundation

print("Lab 2 \"Depth-first search\"  \n")
print("Getting edges from adjacency matrix: \n")

let matrix = MatrixManager()

let node = 2

let array = matrix.getExtensibleNodesForNode(node)
var extensibleNodes = "Extensible nodes from node \(node): \n"

for (index, item) in array.enumerated() {
    if item {
        extensibleNodes += "\(index) "
    }
}

print(extensibleNodes)

//
//  Turnip.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/13.
//

import Foundation

struct Turnip: Codable {
    let filters: [Int]
    let minWeekValue: Int
    let minMaxPattern: [[Int]]
    let avgPattern: [Int]
}


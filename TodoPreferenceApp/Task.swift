//
//  Task.swift
//  TodoPreferenceApp
//
//  Created by 陳彥璋 on 2025/5/8.
//


import Foundation

struct Task: Identifiable, Codable {
    let id = UUID()
    var name: String
    var preference: Int   // -5 to 5
    var complexity: Int   // 0 to 10
}

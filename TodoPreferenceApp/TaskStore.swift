//
//  TaskStore.swift
//  TodoPreferenceApp
//
//  Created by 陳彥璋 on 2025/5/8.
//


import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
}
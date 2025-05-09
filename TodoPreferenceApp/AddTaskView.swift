//
//  AddTaskView.swift
//  TodoPreferenceApp
//
//  Created by 陳彥璋 on 2025/5/8.
//


import SwiftUI

struct AddTaskView: View {
    @ObservedObject var store: TaskStore
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var preference = 0
    @State private var complexity = 5

    var body: some View {
        Form {
            TextField("任務名稱", text: $name)
            Stepper("喜好程度：\(preference)", value: $preference, in: -5...5)
            Stepper("複雜程度：\(complexity)", value: $complexity, in: 0...10)
        }
        .navigationTitle("新增任務")
        .toolbar {
            Button("儲存") {
                store.tasks.append(Task(name: name, preference: preference, complexity: complexity))
                dismiss()
            }
        }
    }
}

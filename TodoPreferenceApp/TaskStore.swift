//
//  TaskStore.swift
//  TodoPreferenceApp
//
//  Created by 陳彥璋 on 2025/5/8.
//


import Foundation

class TaskStore: ObservableObject {
	@Published var tasks: [Task] = [] {
		didSet {
			saveTasks()
		}
	}

	init() {
		loadTasks()
	}

	private let tasksKey = "SavedTasks"

	private func saveTasks() {
		if let encoded = try? JSONEncoder().encode(tasks) {
			UserDefaults.standard.set(encoded, forKey: tasksKey)
		}
	}

	private func loadTasks() {
		if let savedData = UserDefaults.standard.data(forKey: tasksKey),
		   let decoded = try? JSONDecoder().decode([Task].self, from: savedData) {
			tasks = decoded
		}
	}
}

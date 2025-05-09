//
//  ContentView.swift
//  TodoPreferenceApp
//
//  Created by 陳彥璋 on 2025/5/8.
//

import SwiftUI
import Charts

struct ContentView: View {
	@StateObject private var store = TaskStore()
	@State private var showingAlert = false

	var body: some View {
		NavigationView {
			VStack{
				TaskChartView(store: store)
				
				List {
					ForEach($store.tasks) { $task in
						NavigationLink(destination: EditTaskView(task: $task)) {
							VStack(alignment: .leading) {
								Text(task.name)
								Text("喜好：\(task.preference), 複雜：\(task.complexity)")
									.font(.subheadline)
									.foregroundColor(.gray)
							}
						}
					}
					.onDelete { indexSet in
						store.tasks.remove(atOffsets: indexSet)
					}
				}
				.navigationTitle("任務清單")
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						EditButton()
					}
					ToolbarItem(placement: .navigationBarLeading) {
						NavigationLink("新增", destination: AddTaskView(store: store))
					}
				}
				
				Button("清除全部任務", role: .destructive) {
					showingAlert = true
				}
				.alert(isPresented: $showingAlert) {
					Alert(
						title: Text("確定清除？"),
						primaryButton: .destructive(Text("清除")) {
							store.tasks.removeAll()
						},
						secondaryButton: .cancel()
					)
				}
			}
		}
	}
}

struct TaskChartView: View {
	@ObservedObject var store: TaskStore

	var body: some View {
		Chart {
			ForEach(store.tasks) { task in
				PointMark(
					x: .value("喜好", task.preference),
					y: .value("複雜", task.complexity)
				)
				.annotation(position: .top) {
					Text(task.name)
						.font(.caption2)
						.foregroundColor(.gray)
				}
			}
		}
		.frame(height: 300)
		.padding()
		.chartXScale(domain: -5...5)
		.chartYScale(domain: 0...10)
		.chartXAxisLabel("喜好程度")
		.chartYAxisLabel("複雜程度")
	}
}

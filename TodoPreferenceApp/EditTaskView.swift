import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task

    var body: some View {
        Form {
            TextField("任務名稱", text: $task.name)
            Stepper("喜好程度：\(task.preference)", value: $task.preference, in: -5...5)
            Stepper("複雜程度：\(task.complexity)", value: $task.complexity, in: -5...5)
        }
        .navigationTitle("編輯任務")
    }
}
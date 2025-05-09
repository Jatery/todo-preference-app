import Foundation

struct Task: Identifiable, Codable {
    let id = UUID()
    var name: String
    var preference: Int   // -5 to 5
    var complexity: Int   // -5 to 5
}
import Foundation

struct Entry: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var doughNotes: String
    var date: Date
    var note: String
    var createdAt: Date = Date()
}

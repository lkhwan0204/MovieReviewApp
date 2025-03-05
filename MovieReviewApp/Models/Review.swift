import Foundation

struct Review: Codable {
    var id: UUID
    var movieId: UUID
    var content: String
    var rating: Int
}

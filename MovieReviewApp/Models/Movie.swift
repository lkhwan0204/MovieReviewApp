import Foundation

struct Movie: Codable {
    var id: UUID
    var title: String
    var director: String
    var releaseDate: Date
    var genre: String
}

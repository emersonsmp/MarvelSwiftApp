import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

struct MarvelResponse: Codable {
    let data: CharacterDataContainer
}

struct CharacterDataContainer: Codable {
    let results: [Character]
}

struct ExpoInfo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct EntryInfo: Decodable {
    let name: String
    let image_name: String
    let short_desc: String
    let desc: String
}

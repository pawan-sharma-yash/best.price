public struct ProductSubcategory: Hashable, Identifiable {
    public let title: String
    public let id: String

    public init(title: String, id: String) {
        self.title = title
        self.id = id
    }
}

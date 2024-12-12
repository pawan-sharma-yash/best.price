public struct ProductSubcategory: Hashable, Identifiable {
    public let title: String
    public let id: String
    public let imageLink: String?

    public init(title: String, id: String, imageLink: String?) {
        self.title = title
        self.id = id
        self.imageLink = imageLink
    }
}

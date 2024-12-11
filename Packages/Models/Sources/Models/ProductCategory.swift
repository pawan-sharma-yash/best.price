public struct ProductCategory: Identifiable, Hashable {
  public let title: String
  public var id: String

  public init(title: String, id: String) {
    self.title = title
    self.id = id
  }
}

public struct ProductCategory: Identifiable {
  public let title: String
  public let iconURL: String
  public var id: String

  public init(title: String, iconURL: String, id: String) {
    self.title = title
    self.iconURL = iconURL
    self.id = id
  }
}

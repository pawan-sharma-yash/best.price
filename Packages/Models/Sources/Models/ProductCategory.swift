public struct ProductCategory: Identifiable {
  public let title: String
  public let iconURL: String
  public var id: String { title }

  public init(title: String, iconURL: String) {
    self.title = title
    self.iconURL = iconURL
  }
}

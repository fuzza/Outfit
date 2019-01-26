import Foundation

public protocol Outfitable {
  associatedtype WearerType
  
  static var wrd: Wardrobe<WearerType>.Type { get set }
  var wrd: Wardrobe<WearerType> { get set }
}

public extension Outfitable {
  static var wrd: Wardrobe<Self>.Type {
    get { return Wardrobe<Self>.self }
    set { }
  }
  
  var wrd: Wardrobe<Self> {
    get { return Wardrobe(self) }
    set { }
  }
}



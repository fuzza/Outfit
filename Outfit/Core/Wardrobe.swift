import Foundation

public struct Wardrobe<Wearer> {
  public let wearer: Wearer
  
  init(_ wearer: Wearer) {
    self.wearer = wearer
  }
  
  public func tryOn(_ fitting: Fitting<Wearer>) {
    fitting(self)(wearer)
  }
  
  public func tryOn<T: Outfitable>(_ wearer: T, _ fitting: Fitting<T>) {
    wearer.wrd.tryOn(fitting)
  }
}



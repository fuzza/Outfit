import UIKit

extension UIView: Outfitable {}

extension Wardrobe where Wearer: UIView {
  
  public func rounded(_ radius: CGFloat) -> Outfit<Wearer> {
    return {
      $0.layer.masksToBounds = true
      $0.layer.cornerRadius = radius
    }
  }
  
  public func background(_ color: UIColor) -> Outfit<Wearer> {
    return { $0.backgroundColor = color }
  }
}

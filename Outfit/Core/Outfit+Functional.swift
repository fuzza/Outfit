import Foundation

precedencegroup CompositionPrecedence {
  associativity: left
}

infix operator ++: CompositionPrecedence

public func ++<T>(lhs: @escaping Outfit<T>, rhs: @escaping Outfit<T>) -> Outfit<T> {
  return
    { a in
      lhs(a)
      rhs(a)
  }
}

import Foundation

public typealias Outfit<T> = (T) -> Void
public typealias Fitting<T> = (Wardrobe<T>) -> Outfit<T>

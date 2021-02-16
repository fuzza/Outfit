import Foundation

@_functionBuilder
public struct OutfitBuilder {
    public static func buildBlock<T: Outfitable>(_ outfits: Outfit<T>...) -> Outfit<T> {
        return { outfitable in outfits.forEach { $0(outfitable) } }
    }
}

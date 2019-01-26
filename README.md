
# Outfit

[![CI Status](https://img.shields.io/travis/fuzza/Outfit.svg?style=flat)](https://travis-ci.org/fuzza/Outfit)
[![Version](https://img.shields.io/cocoapods/v/Outfit.svg?style=flat)](https://cocoapods.org/pods/Outfit)
[![License](https://img.shields.io/cocoapods/l/Outfit.svg?style=flat)](https://cocoapods.org/pods/Outfit)
[![Platform](https://img.shields.io/cocoapods/p/Outfit.svg?style=flat)](https://cocoapods.org/pods/Outfit)

<!-- vscode-markdown-toc -->
* [Usage](#Usage)
	* [Basic usage](#Basicusage)
	* [Advanced usage](#Advancedusage)
		* [Outfit composition](#Outfitcomposition)
		* [Reuse outfits in subclasses](#Reuseoutfitsinsubclasses)
		* [Override default properties](#Overridedefaultproperties)
* [Example](#Example)
* [Requirements](#Requirements)
* [Installation](#Installation)
* [Author](#Author)
* [License](#License)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='Usage'></a>Usage

### <a name='Basicusage'></a>Basic usage

1. Import the framework

```swift
import Outfit
```

 2. Define conformance of your class to `Outfitable` protocol

```swift

extension MyCustomView: Outfitable {}

```

3. Extend your wardrobe with some nice outfit

```swift

extension Wardrobe where Wearer: MyCustomView {

    func perfectLook() -> Outfit<Wearer> {
        return { 
            // Customize the instance of MyCustomView
            $0.titleColor = .red
            $0.placeholder = "It's something new"
            $0.clipsToBounds = true
        }
    }
}

```

4. Access your wardrobe and try it on

```swift

let view = MyCustomView()

view.wrd.tryOn { 
    $0.perfectLook() 
}
```

5. Have fun!


### <a name='Advancedusage'></a>Advanced usage

#### <a name='Outfitcomposition'></a>Outfit composition

You can combine outfits together using custom concat operator (++)

```swift

extension Wardrobe where Wearer: UIView {
    func rounded(_ radius: CGFloat) -> Outfit<Wearer> {
        return {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = radius
        }
    }
  
    func background(_ color: UIColor) -> Outfit<Wearer> {
        return { $0.backgroundColor = color }
    }

    func defaultView() -> Outfit<Wearer> {
        return rounded(5.0)
        ++ background(.white)
    }
}
```

#### <a name='Reuseoutfitsinsubclasses'></a>Reuse outfits in subclasses

You can reuse outfits from parent class in the child

```swift

extension Wardrobe where Wearer: UIView {
    func defaultView() -> Outfit<Wearer> { ... }
}

extension Wardrobe where Wearer: UIButton {
    func title(_ text: String) -> Outfit<Wearer> {
        return {
            $0.setTitle(text, for: .normal)
        }
    }

    func defaultButton() -> Outfit<Wearer> {
        return defaultView()
            ++ title("Default title")
    }
}

```

#### <a name='Overridedefaultproperties'></a>Override default properties 

If you need to override some property in a single place or add new one, and it doesn't make a sense to define new function for this:

```swift
func viewDidLoad() {
    super.viewDidLoad()

    let view = MyCustomView()
    view.wrd.tryOn {
        $0.perfectLook()
        ++ { $0.titleColor = .green }
    }
}
```

## <a name='Example'></a>Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## <a name='Requirements'></a>Requirements

* Swift 4.2
* Xcode 10

## <a name='Installation'></a>Installation

Outfit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Outfit'
```

## <a name='Author'></a>Author

Oleksii Faizullov, alex.fuzza@gmail.com

## <a name='License'></a>License

Outfit is available under the MIT license. See the LICENSE file for more info.

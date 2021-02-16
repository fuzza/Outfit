//
//  ViewController.swift
//  Outfit
//
//  Created by fuzza on 01/26/2019.
//  Copyright (c) 2019 fuzza. All rights reserved.
//

import UIKit
import Outfit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wrd.tryOn { $0.defaultOutfit }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: Outfitable {}

extension Wardrobe where Wearer: ViewController {
    @OutfitBuilder var defaultOutfit: Outfit<Wearer> {
        viewStyle
        navBarStyle
    }
    
    var viewStyle: Outfit<Wearer> {
        {
            $0.view.backgroundColor = UIColor.green
        }
    }
    
    var navBarStyle: Outfit<Wearer> {
        {
            $0.navigationController?.navigationBar.barTintColor = UIColor.red
        }
    }
}

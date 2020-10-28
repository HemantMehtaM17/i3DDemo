//
//  ViewController.swift
//  i3DDemo
//
//  Created by Hector on 28/10/20.
//  Copyright © 2020 Tuple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var modelDataHandler: ModelDataHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
          modelDataHandler = try ModelDataHandler()
        } catch let error {
          fatalError(error.localizedDescription)
        }
    }


}


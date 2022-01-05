//
//  ViewController.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    let postManager = PostManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello!")
        
       postManager.fetchInfo()
    }

}


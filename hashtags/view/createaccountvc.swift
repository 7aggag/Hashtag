//
//  createaccountvc.swift
//  hashtags
//
//  Created by mohamed haggag on 11/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class createaccountvc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismisscreateaccountvc(_ sender: Any) {
        
performSegue(withIdentifier: "unwindtochannelvc", sender: nil)
    }
    

}

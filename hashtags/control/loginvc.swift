//
//  loginvc.swift
//  hashtags
//
//  Created by mohamed haggag on 11/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class loginvc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signuobtn(_ sender: Any) {
        
performSegue(withIdentifier: "tocreateaccountvc", sender: nil)    }
    
    
    @IBAction func dismisloginvc(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
  
}

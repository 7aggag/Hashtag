//
//  ChannelVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit


class ChannelVC: UIViewController {
    
    //
    @IBAction func prepareforunwind (segue : UIStoryboardSegue){}
    
    @IBOutlet weak var loginbtn : UIButton!
    @IBOutlet weak var profileimage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60 

    }
    
    @IBAction func loginpress(_ sender: Any) {
        
    performSegue(withIdentifier: "tologin", sender: nil	)
        
    }
    
    
}



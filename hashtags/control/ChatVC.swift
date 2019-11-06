//
//  ChatVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit


class ChatVC: UIViewController {
    
    
    @IBOutlet weak var menuebtn:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        menuebtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside )
        self.view.addGestureRecognizer((self.revealViewController().tapGestureRecognizer()))
        self.view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))

}
}

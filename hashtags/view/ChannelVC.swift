//
//  ChannelVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit


class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60 

    }
}



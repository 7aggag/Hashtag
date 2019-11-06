//
//  circularimage.swift
//  hashtags
//
//  Created by mohamed haggag on 11/5/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

@IBDesignable
class circularimage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup(){
        
self.layer.cornerRadius=self.frame.width / 2
        self.clipsToBounds = true
        
    }
    
    

}

//
//  gridant.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//


import  UIKit

@IBDesignable


class gridant : UIView {
    

    @IBInspectable var topcolor : UIColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    @IBInspectable var bottomcolor : UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
 
    
    override func setNeedsLayout() {
        layoutSubviews()
    }
    
    
  override func layoutSubviews() {
    
        let gridantlayer = CAGradientLayer()
            gridantlayer.colors = [topcolor , bottomcolor]
            gridantlayer.startPoint = CGPoint(x: 0, y: 0)
            gridantlayer.endPoint = CGPoint(x: 0, y: 0)
            gridantlayer.frame = self.bounds
            self.layer.insertSublayer(gridantlayer, at: 0)
    
    }
    
    
    
    
    

}

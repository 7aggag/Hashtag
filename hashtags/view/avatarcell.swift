//
//  avatarcell.swift
//  hashtags
//
//  Created by mohamed haggag on 11/5/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

enum avatartype {
    case light
    case dark
}

class avatarcell: UICollectionViewCell {
    
  
    @IBOutlet weak var avatarimage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupavatarcell()
        
    }
    
    func configurecell (index : Int , type : avatartype ){
        
        if type == avatartype.dark{
            let avatarname = "dark\(index)"
            self.avatarimage.image = UIImage(named: avatarname )
            self.layer.backgroundColor = UIColor.lightGray.cgColor
            
        }else {
            let avatarname = "light\(index)"
            self.avatarimage.image = UIImage(named: avatarname )
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    
    func setupavatarcell(){
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        
    }
    
    
}

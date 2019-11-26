//
//  channelcell.swift
//  hashtags
//
//  Created by mohamed haggag on 11/24/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class channelcell: UITableViewCell {

    //iboutlets
    
    @IBOutlet weak var channelname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected{
            
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
             self.layer.backgroundColor = UIColor.clear.cgColor
        }


    }
    
    
    func congigurecell(channel : channel ){
    
    let title = channel.name ?? ""
        channelname.text = "#\(title)"
        
        
    }
    

}

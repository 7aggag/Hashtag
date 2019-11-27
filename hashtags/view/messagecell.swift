//
//  messagecell.swift
//  hashtags
//
//  Created by mohamed haggag on 11/26/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class messagecell: UITableViewCell {
    

    @IBOutlet weak var messagebody : UILabel!
    @IBOutlet weak var timestamp : UILabel!
    @IBOutlet weak var username : UILabel!
    @IBOutlet weak var userpic : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configurecell(message:message){
        
        messagebody.text = message.messageBody
        timestamp.text = message.timeStamp
        username.text = message.userId
        userpic.image = UIImage(named: message.userAvatar)
        userpic.backgroundColor = Userdata.instance.returncolor(compontent: message.userAvatarColor)
        
        
    }

}

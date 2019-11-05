//
//  Userdata.swift
//  hashtags
//
//  Created by mohamed haggag on 11/5/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import Foundation

class Userdata {
    

    static let instance = Userdata()
    
    private(set) public var _id = ""
      private(set) public var email = ""
      private(set) public var avatarname = ""
      private(set) public var avatarcolor = ""
      private(set) public var name = ""
    
    
    func setuser (name : String , email : String , id :String ,avatarcolor :String, avatarname : String ) {
        
        self._id = id
        self.email = email
        self.name = name
        self.avatarname = avatarname
        self.avatarcolor = avatarcolor
        
    }
    
    
    func updateavatrname ( avatarname : String) {
        
        self.avatarname = avatarname
    }
    
    
    
    
}


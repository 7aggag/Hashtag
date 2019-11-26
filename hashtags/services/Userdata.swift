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
    
    func returncolor (compontent : String)->UIColor {
        
        let scancolor = Scanner()
        let skipped = CharacterSet(charactersIn: "[] , ")
        let comma = CharacterSet(charactersIn: ",")
        scancolor.charactersToBeSkipped = skipped
    
        var R,G,B,A :NSString?
        
        
        scancolor.scanUpToCharacters(from: comma, into: &R)
        scancolor.scanUpToCharacters(from: comma, into: &G)
        scancolor.scanUpToCharacters(from: comma, into: &B)
        scancolor.scanUpToCharacters(from: comma, into: &A)
        
        let deuflt = UIColor.lightGray
        
         guard let gardR = R else {return deuflt}
         guard let gardG = G else {return deuflt}
         guard let gardB = B else {return deuflt}
         guard let gardA = A else {return deuflt}
        
        let fr = CGFloat(gardR.doubleValue)
        let fg = CGFloat(gardG.doubleValue)
        let fb = CGFloat(gardB.doubleValue)
        let fa = CGFloat(gardA.doubleValue)
        
        return UIColor(red: fr, green: fg, blue: fb, alpha: fa)
        
        
     
    }
    
    
    func logout()  {
        
         _id = ""
         email = ""
         avatarname = ""
         avatarcolor = ""
         name = ""
        Authserices.instance.isloggedin = false
        Authserices.instance.tokenid = ""
        Authserices.instance.useremail = ""
        Messageservice.innstance.deletechannel()
        
    }
    
}


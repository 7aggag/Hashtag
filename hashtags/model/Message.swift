//
//  Message.swift
//  hashtags
//
//  Created by mohamed haggag on 11/26/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import Foundation

struct message :Codable  {
    
    public private(set) var _id : String!
    public private(set) var messageBody : String!
    public private(set) var userId : String!
    public private(set) var channelId : String!
    public private(set) var userAvatar : String!
    public private(set) var userAvatarColor : String!
    public private(set) var __v : Int!
    public private(set) var timeStamp : String!
    
    
    
    
    init(id : String , message : String , userid : String , channelid : String , useravatar:String , useravatarcolor : String , timestamp : String) {
        _id = id
        messageBody = message
        userId = userid
        channelId = channelid
        userAvatar = useravatar
        userAvatarColor = useravatar
        timeStamp = timestamp
    }
}


	

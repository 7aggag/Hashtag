//
//  channel.swift
//  hashtags
//
//  Created by mohamed haggag on 11/10/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import Foundation



struct channel :Codable {
    
    public private (set)var _id :String!
    public private (set)var name : String!
    public private (set)var description : String!
    public private (set)var __v : Int!
    
    
    
    
    init(channelname : String , channeldes : String , chanelid : String ) {
        
        name = channelname
        _id = chanelid
        description = channeldes
    }
    
}

//
//  SocketServices.swift
//  hashtags
//
//  Created by mohamed haggag on 11/24/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit
import SocketIO

class SocketServices: NSObject {
    
    static let instance = SocketServices()
    
    let manger :SocketManager
    let socket : SocketIOClient
    
    
    
    override init() {
        
        self.manger = SocketManager(socketURL: URL(string:MAIN)!)
        self.socket = manger.defaultSocket
        
        super.init()
    }
    
    
    func establishconnection(){
        socket.connect()
    }
    func closeconnection (){
        socket.disconnect()
    }
    
    func addchannel(name : String , description:String ,completion : @escaping CompletionHandelar){
        
        socket.emit("newChannel", name,description)
        completion(true)
        
        
    }
    
    func getchannels(completion : @escaping CompletionHandelar){
        
        socket.on("channelCreated") { (dataarray, ack) in
            guard let channelname = dataarray[0]  as? String else {return}
            guard let channeldesc = dataarray[1]  as? String else {return}
            guard let channelid = dataarray[2]  as? String else {return}
            
            let newchannel = channel(channelname: channelname, channeldes: channeldesc, chanelid:  channelid)
            Messageservice.innstance.channels.append(newchannel)
            completion(true)
        }
        
        
    }
    

}

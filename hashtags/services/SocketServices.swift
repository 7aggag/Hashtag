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
    
    func sendmessage(messagebody:String , userid : String , channelid:String , completion : @escaping CompletionHandelar ) {
        
        let user = Userdata.instance
        socket.emit("newMessage",messagebody,userid,channelid, user.name , user.avatarname,user.avatarcolor )
        
        completion(true)
        
    }
    
    
    
    func getchatmessage (completion :@escaping CompletionHandelar){
        
        socket.on("messageCreated") { (dataarray, ack) in
            guard let messagebody = dataarray[0] as? String  else {return}
            guard let cahnnelid = dataarray[2] as? String  else {return}
            guard let username = dataarray[3] as? String  else {return}
            guard let useravatar = dataarray[4] as? String  else {return}
            guard let useravatarcolor = dataarray[5] as? String  else {return}
            guard let id = dataarray[6] as? String  else {return}
            guard let timestamp = dataarray[7] as? String  else {return}

         
            
            if cahnnelid == Messageservice.innstance.selectedchannel?._id && Authserices.instance.isloggedin{
                   let newmessage = message(id: id , message: messagebody, userid: username, channelid:cahnnelid, useravatar: useravatar, useravatarcolor: useravatarcolor, timestamp:timestamp)
            Messageservice.innstance.messages.append(newmessage)
            completion(true)
            }
        else {
            completion(false)
        }}
        
    }
    

}

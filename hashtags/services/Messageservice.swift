//
//  Messageservice.swift
//  hashtags
//
//  Created by mohamed haggag on 11/10/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Messageservice :Codable {
    
    static let innstance = Messageservice()
    var channels = [channel]()
    var selectedchannel : channel?
    
    var messages = [message]()
    
    
    func gechannels (completion : @escaping CompletionHandelar) {
        let header = ["Authorization": "Bearer \(Authserices.instance.tokenid)" , "Content-Type" : "application/json" ]
        Alamofire.request(FIND_CHANELS_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).response { (response) in
            if response.error == nil {
                guard let data = response.data else {return}
                do {
                    self.channels = try JSONDecoder().decode([channel].self, from: data)
                    completion(true)
                    NotificationCenter.default.post(name:NOTI_CHAT_LOADED , object: nil)
                    
                }catch let error {
                    debugPrint(error)
                }}}}
    
    func messagebychannel(channelid:String , completion : @escaping CompletionHandelar){
         let header = ["Authorization": "Bearer \(Authserices.instance.tokenid)" , "Content-Type" : "application/json" ]
        Alamofire.request("\(FIND_MESSAGES_URL)\(channelid)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).response { (Response) in
            if Response.error == nil {
                self.deletemessages()
                guard let data = Response.data else {return}
                do {
                    self.messages = try JSONDecoder().decode([message].self, from: data)
                    completion(true)
                    
                }catch let error {
                    debugPrint(error)
                }
            }else {
                debugPrint(Response.error as Any)
                completion(false)
            }
        }
    }
    
  
    

    func deletechannel(){
        channels.removeAll()
    }
    
    func deletemessages(){
        messages.removeAll()
    }
}

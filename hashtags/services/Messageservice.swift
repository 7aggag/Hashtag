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
    
    
    func gechannels (completion : @escaping CompletionHandelar) {
        let header = ["Authorization": "Bearer \(Authserices.instance.tokenid)" , "Content-Type" : "application/json" ]
        Alamofire.request(FIND_CHANELS_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).response { (response) in
            if response.error == nil {
                guard let data = response.data else {return}
                do {
                    self.channels = try JSONDecoder().decode([channel].self, from: data)
                    completion(true)
                    print(self.channels)
                }catch let error {
                    debugPrint(error)
                }
                
                
                
            }
            
        }
        
        
    }
    
    
    
}

	//
//  Authservice.swift
//  hashtags
//
//  Created by mohamed haggag on 11/4/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//
    
    import Foundation
    import Alamofire
    import SwiftyJSON
    
    
    class Authserices {
        
        static let instance = Authserices()
        let deauflts = UserDefaults.standard
        
        
        var isloggedin :Bool {
            set{ deauflts.set(newValue, forKey: LOGIN_KEY)
            }
            get{ return  deauflts.bool(forKey: LOGIN_KEY)
            }}
        var tokenid : String {
            set{ deauflts.set(newValue, forKey: TOKEN_ID)
            }
            get{ return deauflts.value(forKey: TOKEN_ID) as! String
                }
        }
        var useremail : String {
            set{
                deauflts.set(newValue, forKey: EMAIL)
            }
            get{
                return deauflts.value(forKey: EMAIL) as! String
            }
        }
        
        func registeruser (email : String , Password : String ,complection: @escaping CompletionHandelar	){
            let loweemail = email.lowercased()
            
            let header = ["Content-Type" : "application/json; charset=utf-8"]
            let body : [String : Any] = ["email" : loweemail ,"password" : Password]
            
            Alamofire.request(REGISTE_USER_URL,method: .post , parameters: body , encoding: JSONEncoding.default , headers: header).responseString { (response) in
                if  response.result.error == nil {
                    complection(true)
                }else{
                    complection(false)
                    debugPrint(response.result.error as Any)
                }
                }}
        
        
        func loginuser (email : String , Password : String ,complection: @escaping CompletionHandelar){
            let loweemail = email.lowercased()
            let header = ["Content-Type" : "application/json; charset=utf-8"]
            let body : [String : Any] = ["email" : loweemail ,"password" : Password]
            
            Alamofire.request(LOGIN_UEL, method: .post, parameters: body , encoding: JSONEncoding.default , headers: header).responseJSON { (response) in
                if response.result.error == nil {
                    guard let data = response.data else {return}
                     let json = try? JSON(data: data)
                    self.useremail = json!["user"].stringValue
                    self.tokenid = json!["token"].stringValue
                        complection(true)
                     self.isloggedin = true
                    }
                else  {
                    complection(false)
                    debugPrint(response.result.error as Any)
                }}}
        
        func adduser (name : String , email : String , avatarname : String , avatarcokor : String , complection : @escaping CompletionHandelar){
            let loweemail = email.lowercased()
            let header = ["Authorization": "Bearer \(Authserices.instance.tokenid)" , "Content-Type" : "application/json" ]
            let body : [String : Any] = ["email": loweemail ,"name":name,"avatarName" : avatarname , "avatarColor" : avatarcokor]
            
            Alamofire.request(ADD_USER_URL, method: .post, parameters: body , encoding: JSONEncoding.default , headers: header).responseJSON { (response) in
                if response.result.error == nil {
                    guard let data = response.data else {return}
                    let json = try? JSON(data: data)
                    let id = json!["_id"].stringValue
                    let avatarc0olor = json!["avatarColor"].stringValue
                    let avatarname = json!["avatarName"].stringValue
                    let email = json!["email"].stringValue
                    let name = json!["name"].stringValue
                    
                    Userdata.instance.setuser(name: name, email: email, id: id, avatarcolor: avatarc0olor, avatarname: avatarname)
                    
                    complection(true)
                }
                else  {
                    complection(false)
                    debugPrint(response.result.error as Any)
                }}
      }
       
        
        func finduserbyemail(completion :@escaping CompletionHandelar){
             let header = ["Authorization": "Bearer \(Authserices.instance.tokenid)" , "Content-Type" : "application/json" ]
            Alamofire.request("\(LOGIN_WITH_EMAIL_URL)\(useremail)", method: .get, parameters: nil , encoding: JSONEncoding.default , headers: header).responseJSON { (response) in
                if response.result.error == nil {
                    guard let data = response.data else {return}
                    let json = try? JSON(data: data)
                    let id = json!["_id"].stringValue
                    let avatarc0olor = json!["avatarColor"].stringValue
                    let avatarname = json!["avatarName"].stringValue
                    let email = json!["email"].stringValue
                    let name = json!["name"].stringValue
                    
                   
                    Userdata.instance.setuser(name: name, email: email, id: id, avatarcolor: avatarc0olor, avatarname: avatarname)
                    completion(true)
                }
                else  {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            
        }
        
        
            }
    }

//
//  Serconstant.swift
//  hashtags
//
//  Created by mohamed haggag on 11/4/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import Foundation

//

typealias CompletionHandelar = (_ sucess : Bool ) -> ()

// API constants

let MAIN = "http://localhost:3005/v1/"
let REGISTE_USER_URL = "\(MAIN)account/register"
let LOGIN_UEL = "\(MAIN)account/login"
let ADD_USER_URL = "\(MAIN)user/add"
let LOGIN_WITH_EMAIL_URL = "\(MAIN)/user/byEmail/"
let FIND_CHANELS_URL = "\(MAIN)channel"
let FIND_MESSAGES_URL = "\(MAIN)message/byChannel/"



//  user constant
let LOGIN_KEY = "LoggedIn"
let EMAIL = "UserEmail"
let TOKEN_ID = "TokenId"


//notifcation

let NOTI_USE_DATA_DID_CHANGE = Notification.Name("notfidatauserchanged")
let NOTI_CHAT_LOADED = Notification.Name("chatloaded")
let NOTI_CHANNEL_SELECTED = Notification.Name("channelselected")








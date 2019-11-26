//
//  ChatVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//


import UIKit


class ChatVC: UIViewController {
    
    
    @IBOutlet weak var menuebtn:UIButton!
    
    @IBOutlet weak var chtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuebtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside )
        self.view.addGestureRecognizer((self.revealViewController().tapGestureRecognizer()))
        self.view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))

        if Authserices.instance.isloggedin{
            Authserices.instance.finduserbyemail { (scuss) in
                if scuss{ NotificationCenter.default.post(name: NOTI_USE_DATA_DID_CHANGE, object: nil)}
            }
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userdatadidchange(_:)), name: NOTI_USE_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.chanelselected(_:)), name: NOTI_CHANNEL_SELECTED, object: nil)
        
        
       
}
    
    @objc func userdatadidchange (_ notfi : Notification){
        if Authserices.instance.isloggedin{
            onmessage()
                }else{
                    self.chtitle.text = "Please log in "
            
        }}

    func onmessage (){
        Messageservice.innstance.gechannels { (scuss) in
            if scuss{
                //messages
                
            }}}


@objc func chanelselected (_ notfi : Notification){
    updatechannel()
}
    
    func updatechannel (){
        let title = Messageservice.innstance.selectedchannel?.name ?? ""
        chtitle.text = "#\(title)"
    }
}

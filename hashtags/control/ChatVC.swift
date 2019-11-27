//
//  ChatVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//


import UIKit


class ChatVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var vie: UIView!
    

    
    
    @IBOutlet weak var messagetb: UITableView!
    @IBOutlet weak var typemessgetf: UITextField!
    @IBOutlet weak var menuebtn:UIButton!
    @IBOutlet weak var chtitle: UILabel!
    
    @IBOutlet weak var sendbtn: UIButton!
    
   
    var istying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendbtn.isHidden = true
        //table
        messagetb.delegate=self
        messagetb.dataSource=self
        messagetb.estimatedRowHeight=80
        messagetb.rowHeight = UITableView.automaticDimension
        
        
        menuebtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside )
        self.view.addGestureRecognizer((self.revealViewController().tapGestureRecognizer()))
        self.view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))

        if Authserices.instance.isloggedin{
            Authserices.instance.finduserbyemail { (scuss) in
                if scuss{ NotificationCenter.default.post(name: NOTI_USE_DATA_DID_CHANGE, object: nil)}
            }
            
        }
        
        SocketServices.instance.getchatmessage { (scuss) in
            if scuss{
                self.messagetb.reloadData()
                if Messageservice.innstance.messages.count > 0 {
                    
                    let indexpath = IndexPath(row: Messageservice.innstance.messages.count-1, section: 0)
                    self.messagetb.scrollToRow(at: indexpath, at: .bottom , animated: false)
                }
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userdatadidchange(_:)), name: NOTI_USE_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.chanelselected(_:)), name: NOTI_CHANNEL_SELECTED, object: nil)
        view.bindToKeyboard()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ChatVC.closegesture))
        view.addGestureRecognizer(gesture)
        
}
    
    @objc func userdatadidchange (_ notfi : Notification){
        if Authserices.instance.isloggedin{
            onmessage()
                }else{
                    self.chtitle.text = "Please log in "
                messagetb.isHidden = true
            messagetb.reloadData()
            
        }}

    func onmessage (){
        Messageservice.innstance.gechannels { (scuss) in
            if scuss{
                if Messageservice.innstance.messages.count > 0{
                    Messageservice.innstance.selectedchannel = Messageservice.innstance.channels[0]
                    self.updatechannel()
                } else {
                    self.chtitle.text = "No Channels"
                }
            }}}


    @objc func closegesture(){
        
        view.endEditing(true)
    }
    
    func getmessages (){
        guard let chanid = Messageservice.innstance.selectedchannel?._id else {return}
        Messageservice.innstance.messagebychannel(channelid: chanid) { (scuss) in
            if scuss {
                self.messagetb.reloadData()
            }
        }		
    }
    
@objc func chanelselected (_ notfi : Notification){
    updatechannel()
}
    func updatechannel (){
        let title = Messageservice.innstance.selectedchannel?.name ?? ""
        chtitle.text = "#\(title)"
        getmessages()
    }
    
    
    @IBAction func msboxediting(_ sender: Any) {
        if typemessgetf.text == "" {
            sendbtn.isHidden = true
            istying = false

        }else {
            if istying==false {
                sendbtn.isHidden = false

            }
        }
        
        
        istying = true
        
    }
    
   
   
    
    
    
    //sending message
    
    
    @IBAction func sendmessage(_ sender: Any) {
        
        if Authserices.instance.isloggedin{
            guard let channelid = Messageservice.innstance.selectedchannel?._id else {return}
            guard let message = typemessgetf.text else {return}
            
            SocketServices.instance.sendmessage(messagebody: message, userid: Userdata.instance._id, channelid: channelid) { (scuss) in
                if scuss {
                    self.typemessgetf.text = ""
                    self.typemessgetf.resignFirstResponder()
                }else{
                    debugPrint("error")
                }
                
            }}
        
    }
    
    
    
    //tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messageservice.innstance.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"messagecell", for: indexPath)as?messagecell {
            let message = Messageservice.innstance.messages[indexPath.row]
            cell.configurecell(message: message)
            return cell
            
        }else {
             return UITableViewCell()
            
        }
        
       
    }
    
    
}

//
//  ChannelVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit


class ChannelVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
  
    
    
    //
    @IBAction func prepareforunwind (segue : UIStoryboardSegue){}
    @IBOutlet weak var loginbtn : UIButton!
    @IBOutlet weak var profileimage : UIImageView!
    
    @IBOutlet weak var tabelview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource=self
        SocketServices.instance.getchannels { (scuess) in
            if scuess {
                self.tabelview.reloadData()
            }
        }
        
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userdatahaschanged(_:) ), name: NOTI_USE_DATA_DID_CHANGE , object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.channelloaded(_:)), name: NOTI_CHAT_LOADED , object: nil)
        
        print(Authserices.instance.tokenid)
    }
    override func viewDidAppear(_ animated: Bool) {
       setupdata()
    }
    @objc func userdatahaschanged(_ notif : Notification){
            setupdata()
    }
    
    
    
    @IBAction func addchannelpress(_ sender: Any) {
        if Authserices.instance.isloggedin{
        let addchannel = Addchannel()
        addchannel.modalPresentationStyle = .custom
        present(addchannel, animated: true, completion: nil)
    }
        
    }
    
    
    @IBAction func loginpress(_ sender: Any) {
    
        if Authserices.instance.isloggedin {
  
            //show profile
            let profile = profilevc()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: "tologin", sender: nil    )
        }
    }
    
    func setupdata (){
        if Authserices.instance.isloggedin{
            loginbtn.setTitle("\(Userdata.instance.name)", for: .normal)
            profileimage.image = UIImage(named: Userdata.instance.avatarname )
            profileimage.backgroundColor = Userdata.instance.returncolor(compontent: Userdata.instance.avatarcolor)
          
            
        }else {
            loginbtn.setTitle("Login", for: .normal)
            profileimage.image = UIImage(named: "profileDefault" )
            profileimage.backgroundColor = UIColor.clear
              tabelview.reloadData()
        }
    }
    
    
    
    
    ///table view
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messageservice.innstance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelcell", for: indexPath)as? channelcell{
            let channel = Messageservice.innstance.channels[indexPath.row]
            cell.congigurecell(channel: channel)
            return  cell
        }else {
            return UITableViewCell()	
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = Messageservice.innstance.channels[indexPath.row]
        Messageservice.innstance.selectedchannel=channel
        NotificationCenter.default.post(name: NOTI_CHANNEL_SELECTED, object: nil)
        self.revealViewController()?.revealToggle(animated: true)
        
    }
    
    @objc func channelloaded (_ notfi : Notification){
        tabelview.reloadData()
    }
    
}



//
//  ChannelVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/2/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit


class ChannelVC: UIViewController {
    
    //
    @IBAction func prepareforunwind (segue : UIStoryboardSegue){}
    
    @IBOutlet weak var loginbtn : UIButton!
    @IBOutlet weak var profileimage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userdatahaschanged(_:) ), name: NOTI_USE_DATA_DID_CHANGE , object: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
       setupdata()
    }
    @objc func userdatahaschanged(_ notif : Notification){
            setupdata()
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
        }
    }
    
}



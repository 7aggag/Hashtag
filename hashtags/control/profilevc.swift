//
//  profilevc.swift
//  hashtags
//
//  Created by mohamed haggag on 11/6/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit



class profilevc: UIViewController {
    
    //@iboutlets
    
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var proemaillb : UILabel!
    @IBOutlet weak var pronamelb : UILabel!
    @IBOutlet weak var proimage : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func closeprovc(_ semder :Any){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func logout(_ semder :Any){
        
        Userdata.instance.logout()
        NotificationCenter.default.post(name: NOTI_USE_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func setup(){
        
        proemaillb.text = Userdata.instance.email
        pronamelb.text = Userdata.instance.name
        proimage.image = UIImage(named: Userdata.instance.avatarname)
        proimage.backgroundColor = Userdata.instance.returncolor(compontent: Userdata.instance.avatarcolor)
        let touchcloseproscrenn = UITapGestureRecognizer(target: self, action: #selector(self.close))
        bgview.addGestureRecognizer(touchcloseproscrenn)
        
    }
    @objc func close (gesture : UITapGestureRecognizer){
    
    self.dismiss(animated: true, completion: nil)
    }
    
    

}

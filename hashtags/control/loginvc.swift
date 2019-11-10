//
//  loginvc.swift
//  hashtags
//
//  Created by mohamed haggag on 11/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class loginvc: UIViewController {

    //iboutlet
    
    @IBOutlet weak var useremaitf:UITextField!
    @IBOutlet weak var passwordtf:UITextField!
    @IBOutlet weak var spinner : UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview ()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signuobtn(_ sender: Any) {
        
performSegue(withIdentifier: "tocreateaccountvc", sender: nil)    }
    
    
    @IBAction func dismisloginvc(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func login (_ sender :Any){
        spinner.isHidden = false
        spinner.startAnimating()
        guard let useremail = useremaitf.text , useremaitf.text != "" else{return}
        guard let userpass = passwordtf.text , passwordtf.text != "" else{return}
        
        Authserices.instance.loginuser(email: useremail, Password: userpass) { (sucess) in
            if sucess {
                Authserices.instance.finduserbyemail(completion: { (sucess) in
                    if sucess{
                    NotificationCenter.default.post(name: NOTI_USE_DATA_DID_CHANGE, object: nil)
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                        
                        print(Userdata.instance._id )
                        print(Userdata.instance.avatarname)
                        print(Userdata.instance.name)
                        print(Userdata.instance.avatarcolor)
                    }
                })}
            }
    }
    func setupview (){
        spinner.isHidden = true
        useremaitf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0.3722015275, blue: 0.7716529188, alpha: 1)])
          passwordtf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0.3722015275, blue: 0.7716529188, alpha: 1)])
    }
  
}

//
//  createaccountvc.swift
//  hashtags
//
//  Created by mohamed haggag on 11/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class createaccountvc: UIViewController {

    //iboutlet
    
    @IBOutlet weak var usernametf : UITextField!
    @IBOutlet weak var emailtf : UITextField!
    @IBOutlet weak var passwordtf : UITextField!
    @IBOutlet weak var registeruserbtn : UIButton!
    @IBOutlet weak var choseavatarbtn : UIButton!
    @IBOutlet weak var avatarimage : UIImageView!
    
    
    
    
        let avatr0name = "dark12"
        let avatart0color = "hexValue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismisscreateaccountvc(_ sender: Any) {
        
performSegue(withIdentifier: "unwindtochannelvc", sender: nil)
    }
    
    
    @IBAction func choseavatarbtnpressed(_ sender: Any) {
    }
    
    @IBAction func registeraaccountbtnpressed(_ sender: Any) {
        
        guard let email = emailtf.text?.lowercased() , emailtf.text != ""  else{return}
         guard let pass = passwordtf.text?.lowercased() , passwordtf.text != ""  else{return}
            guard let name = usernametf.text?.lowercased() , usernametf.text != ""  else{return}
        Authserices.instance.registeruser(email: email, Password: pass) { (sucess) in
            if sucess {
                Authserices.instance.loginuser(email: email, Password: pass, complection: { (sucess) in
                    if sucess{
                        print ("done 2")
                        Authserices.instance.adduser(name: name, email: email, avatarname: self.avatr0name , avatarcokor: self.avatart0color , complection: { (sucess) in
                            if sucess{
                                print ("done 3")
                                 print(Userdata.instance._id)
                                self.performSegue(withIdentifier: "unwindtochannelvc", sender: nil)
                               
                                
                                
                                
                            }
                            
                            
                        })
                        
                        
                    }
                })
                
            }
          
            
            
        }
        
        
    }
    
    @IBAction func geneartebckcolorbtnpressed(_ sender: Any) {
    }

    
    
    
    
}

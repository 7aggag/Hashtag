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
    @IBOutlet weak var progrss :UIActivityIndicatorView!
    
    
    // variables
    
        var avatr0name = "dark12"
        var avatart0color = "[0.05 , 0.05  ,0.5 , 1 ]"
        var bgcolor :UIColor?
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if  Userdata.instance.avatarname != "" {
            self.avatarimage.image=UIImage(named:Userdata.instance.avatarname )
            self.avatr0name = Userdata.instance.avatarname
            if avatr0name.contains("light") && bgcolor==nil {
                avatarimage.backgroundColor=UIColor.lightGray
            }
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismisscreateaccountvc(_ sender: Any) {
        
performSegue(withIdentifier: "unwindtochannelvc", sender: nil)
    }
    
    
    @IBAction func choseavatarbtnpressed(_ sender: Any) {
    }
    
    @IBAction func registeraaccountbtnpressed(_ sender: Any) {
        progrss.isHidden = false
        progrss.startAnimating()
        
        guard let email = emailtf.text?.lowercased() , emailtf.text != ""  else{return}
         guard let pass = passwordtf.text?.lowercased() , passwordtf.text != ""  else{return}
            guard let name = usernametf.text?.lowercased() , usernametf.text != ""  else{return}
        Authserices.instance.registeruser(email: email, Password: pass) { (sucess) in
            if sucess {
                Authserices.instance.loginuser(email: email, Password: pass, complection: { (sucess) in
                    if sucess{
                        Authserices.instance.adduser(name: name, email: email, avatarname: self.avatr0name , avatarcokor: self.avatart0color , complection: { (sucess) in
                            if sucess{
                            self.progrss.isHidden = true
                            self.progrss.stopAnimating()
                                
                                self.performSegue(withIdentifier: "unwindtochannelvc", sender: nil)
                                NotificationCenter.default.post(name: NOTI_USE_DATA_DID_CHANGE, object: nil)
                                
                            }})}})}}

    }
    
    @IBAction func geneartebckcolorbtnpressed(_ sender: Any) {
        
        let r =  CGFloat( arc4random_uniform(255))/255
        let g = CGFloat( arc4random_uniform(255))/255
        let b = CGFloat( arc4random_uniform(255))/255
        avatart0color = "[ \(r), \(g), \(b), 1]"
        bgcolor = UIColor(red: r, green: g, blue: b, alpha: 1)
        self.avatarimage.backgroundColor=bgcolor
    }
  
    
    @IBAction func choseavatar (_ sender : Any ) {
        
        performSegue(withIdentifier: "toavatarvc", sender: nil)
        
    }
    
    
    func setupview(){
        
        //progress
        progrss.isHidden = true
        //txtfiel
        let color = #colorLiteral(red: 0, green: 0.3722015275, blue: 0.7716529188, alpha: 1)
        usernametf.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : color])
        passwordtf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : color])
        emailtf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        
        //gesture
        
        let tap = UIGestureRecognizer(target: self, action: #selector(createaccountvc.tapscreen) )
        view.addGestureRecognizer(tap)
    }
    
   @objc  func tapscreen (){
        view.endEditing(true)
    }
    
    
}

//
//  Addchannel.swift
//  hashtags
//
//  Created by mohamed haggag on 11/12/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class Addchannel: UIViewController {
    
    //@iboutlets
    
    @IBOutlet weak var channelname : UITextField!
    @IBOutlet weak var channeldescrption : UITextField!
    @IBOutlet weak var addchanell:UIButton!
    @IBOutlet weak var bgview :UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
    
    @IBAction func closaddchanel(_ sender: Any){ dismiss(animated: true, completion: nil)}

    @IBAction func addchanel(_ sender: Any){
        
        guard let name = channelname.text , channelname.text != "" else {return }
        guard let desc = channeldescrption.text , channeldescrption.text != "" else {return }
        SocketServices.instance.addchannel(name: name, description: desc) { (scuss) in
            if scuss{
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        
    }

    
    func setupview (){
        
        let closegesture = UITapGestureRecognizer(target: self, action: #selector(Addchannel.close(_:)))
        bgview.addGestureRecognizer(closegesture)
        channelname.attributedPlaceholder = NSAttributedString(string: "Channel Name", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)])
        channeldescrption.attributedPlaceholder = NSAttributedString(string: "Channel Descrption", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)])
        
    }
    @objc func close (_ gesture : UITapGestureRecognizer){
     
        dismiss(animated: true, completion: nil)
    }
    
}

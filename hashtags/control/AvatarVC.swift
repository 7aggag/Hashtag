//
//  AvatarVC.swift
//  hashtags
//
//  Created by mohamed haggag on 11/5/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

class AvatarVC: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {

    
    
    
    
    // @iboutlet
    @IBOutlet weak var avatarcollection : UICollectionView!
    @IBOutlet weak var avatarsegmant : UISegmentedControl!
    
    
    //variable
    
    var avatrtypee = avatartype.dark
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        avatarcollection.delegate = self
        avatarcollection.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissavatarvc (_ sender : Any){
        self.dismiss(animated: true, completion: nil)
    }
    

    //colectionview methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarcell", for: indexPath) as? avatarcell{
            cell.configurecell(index: indexPath.item, type: avatrtypee)
            return cell
            }
        return avatarcell()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numbofcoulm : CGFloat = 3
        
        if UIScreen.main.bounds.width > 320 {
            numbofcoulm = 4
        }
        
        let space : CGFloat = 10
        let bandding :CGFloat = 40
        
        
        let itemsiezedeminational = ((collectionView.bounds.width - bandding) - (numbofcoulm-1)*space) / numbofcoulm
        
        return CGSize(width: itemsiezedeminational, height: itemsiezedeminational)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avatrtypee == .dark {
            Userdata.instance.updateavatrname(avatarname: "dark\(indexPath.item)")
            
        }else { Userdata.instance.updateavatrname(avatarname: "light\(indexPath.item)")}
    
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func choseavatartype (_ sender : Any ){
        if avatarsegmant.selectedSegmentIndex == 0 {
            avatrtypee = .dark
        }else {
            avatrtypee = .light
        }
        // print("\(avatrtypee)")
        avatarcollection.reloadData()
    }

}

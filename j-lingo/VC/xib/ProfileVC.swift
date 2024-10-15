//
//  ProfileVC.swift
//  j-lingo
//
//  Created by as on 8/11/24.
//

import UIKit
import SafariServices

final class ProfileVC: BaseCVVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var settingNameArr = ["Settings", "Theme" , "Push Notification" , "Privacy and Security" ,"Help & Feedback", "Share Profile"]
    var isFlipped : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }
    
    
    
    private func setup() {
        self.TitleLbl.text = "Profile"
        self.TitleLbl.isHidden = false
        
        cv.register(ProfileCVCell.self)
        cv.register(SignOUtCVCell.self)
        cv.register(CVCellWithButton.self)
        cv.delegate = self
        cv.dataSource = self
      
        cv.animateSection(0, with: .fadeSlideFromTop)
        cv.animateSection(1, with: .slideInFromBottom)
        cv.animateSection(2, with: .scaleUp)
    }

}

//MARK: - collectionview

extension ProfileVC {
    
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    if (indexPath.section == 1 && indexPath.item == 5 ){
        SafariHelper.openURL(Constants.Links.shareProfile, from: self)
    }
}
    
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if section == 1 {
        return settingNameArr.count
    }
    return 1
}
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch indexPath.section {
    case 0:
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "ProfileCVCell", for: indexPath) as! ProfileCVCell
        if(isFlipped == false){
            cell.shapedView.flip360(duration: 0.5,repeatCount: 2)
            isFlipped = true
        }
        return cell
    case 1:
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "CVCellWithButton", for: indexPath) as! CVCellWithButton
        cell.settingName.text = settingNameArr[indexPath.item]
        return cell
    case 2:
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "SignOUtCVCell", for: indexPath) as! SignOUtCVCell
        cell.vc = self
        return cell
    default:
        return UICollectionViewCell()
    }
    
   
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    switch indexPath.section {
    case 0:
        return CGSize.init(width: Constants.Screen.screenwidth , height:  Constants.Screen.screenheight * 0.25)
    case 1:
        return CGSize.init(width: Constants.Screen.screenwidth , height:  50)
    case 2:
        return CGSize.init(width: Constants.Screen.screenwidth , height:  Constants.Screen.screenheight * 0.25)
    default:
        return CGSize.init(width: 0, height: 0)
    }
   
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        default:
            return UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20)
        }
        
       
    }
}

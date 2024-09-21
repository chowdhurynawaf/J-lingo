//
//  NotificationVC.swift
//  j-lingo
//
//  Created by as on 8/11/24.
//

import UIKit
import SafariServices

final class NotificationVC: BaseCVVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
 
    
    
    var dataArr : [NotificationModel] =  Constants.Notification.generateDummyNotifications()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        self.TitleLbl.text = "Notification"
        self.TitleLbl.isHidden = false
        
        cv.register(NotificationCVCell.self)
        cv.delegate = self
        cv.dataSource = self
        
        cv.animateSection(0, with: .zoomInBounce)
    }
}

//MARK: - collectionview

extension NotificationVC {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataArr .count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = cv.dequeueReusableCell(withReuseIdentifier: "NotificationCVCell", for: indexPath) as! NotificationCVCell
    let data = dataArr[indexPath.item]
    cell.imgView.image = data.image
    cell.imgView.tintColor = .black
    cell.dateLbl.text = data.date
    cell.notificationLbl.text = data.content
    
    cv.applyScrollingAnimation(to: cell, at: indexPath, with: .scaleUp)
    
    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize.init(width: Constants.Screen.screenwidth, height: 80)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            SafariHelper.openURL(Constants.QuizURl.WQ_1, from: self)
        case 1:
            SafariHelper.openURL(Constants.QuizURl.DQ_1, from: self)
        case 2:
            pushWithData(ofType: MessageVC.self){ vc in
                vc.name = "Bob Marley"
                
            }
            
        default:
            print("")
        }
    }

}

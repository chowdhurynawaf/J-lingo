//
//  AllMessageVC.swift
//  j-lingo
//
//  Created by as on 8/14/24.
//
import UIKit
import Lottie

final class AllMessageVC : BaseCVVC , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    let dummyData: [MessageList] = [
        
        MessageList(animationName: "p1", name: "Alice Cooper", message: "Hey, what's up?"),
        MessageList(animationName: "p2", name: "Bob Marley", message: "Not much, just chillin'. You?"),
        MessageList(animationName: "p3", name: "Charlie Brown", message: "Wanna grab some coffee later?"),
        MessageList(animationName: "man1", name: "Daisy Ridley", message: "Sure, let's meet at the usual spot."),
        MessageList(animationName: "man2", name: "Elvis Presley", message: "Have you heard that new song?"),
        MessageList(animationName: "man3", name: "Freddie Mercury", message: "Yeah, it's awesome! Let's jam.")
        
    ]

    
    override func viewDidLoad() {
        
        setup()
    }
    
    private func setup() {
        
        TitleLbl.text = "Messages"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(MessageListCVCell.self)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = false
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
    }
}

//MARK: - UicollectionView

extension AllMessageVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "MessageListCVCell", for: indexPath)
            as! MessageListCVCell
            
            if (0...2).contains(indexPath.row) {
                
            cell.imgView.isHidden  = true
            cell.lottieImg.isHidden = false
            cell.lottieImg.animation = LottieAnimation.named(dummyData[indexPath.item].animationName)
            cell.lottieImg.loopMode = .autoReverse
            cell.lottieImg.play()
            cell.nameLbl.text = dummyData[indexPath.item].name
            cell.messagelbl.text = dummyData[indexPath.item].message
            
            return cell
                
            }else {
                
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "MessageListCVCell", for:indexPath)
            as! MessageListCVCell
            cell.imgView.isHidden  = false
            cell.lottieImg.isHidden = true
            cell.imgView.image = UIImage.init(named: dummyData[indexPath.row].animationName)
            cell.nameLbl.text = dummyData[indexPath.item].name
            cell.messagelbl.text = dummyData[indexPath.item].message
                
                if ((indexPath.item == 4 ) || (indexPath.item == 3))  {
                cell.activeView.isHidden = false
            }
            
            return cell
                
            }
            
        case 1:
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "MessageListCVCell", for: indexPath) as! MessageListCVCell
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        
        case 0:
            return CGSize.init(width: Constants.Screen.screenwidth , height:  80)
            
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
            return UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        default:
            return UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.init(width:Constants.Screen.screenwidth , height:  20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc  = MessageVC.init(nibName: "MessageVC", bundle: nil)
        vc.name  = dummyData[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
 }



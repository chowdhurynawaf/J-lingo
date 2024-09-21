//
//  LeadershipByCategoryVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//


import UIKit

final class LeadershipByCategoryVC : BaseCVVC , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        
        TitleLbl.text = "Leadership Board"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(WQCVCell.self)
        cv.register(QuizCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .fadeSlideFromBottom)
        
    }
    
    fileprivate func configireDQCV(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "QuizCVCell", for: indexPath) as! QuizCVCell
        
        cell.imgview.image = UIImage(named: "DQ")
        cell.imgview.isHidden = false
        cell.centerLbl.font = UIFont.init(name: Constants.Font.poppins_bold, size: 15)
        cell.shapedView.layer.cornerRadius = 15
        cell.imgview.contentMode = .scaleAspectFill
        cell.imgview.applyDropShadow()
        cell.centerLbl.applyDropShadow()
        cell.titleLbl.applyDropShadow()
        cell.centerLbl.setAngle(-50)
        cell.centerLbl.text = "DQ_\(19 - indexPath.item )"
        cell.titleLbl.text = "DQ_\(19 - indexPath.item)"
        
        return cell
    }
    
    fileprivate func configureWQCV(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: indexPath) as! WQCVCell
        
        cell.img.image = UIImage()
        cell.centerLbl.text = ""
        cell.lbl.text = ""
        
        cell.parentHolderView.borderColor = .separator
        cell.parentHolderView.borderWidth = 2
        cell.parentHolderView.layer.cornerRadius = 10
        cell.centerLbl.font = UIFont.init(name: Constants.Font.poppins_bold, size: 15)
        cell.lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 20)
        cell.centerLbl.applyDropShadow()
        cell.img.image = UIImage(named: "WQ")
        cell.img.contentMode = .scaleAspectFill
        cell.centerLbl.setAngle(-50)
        cell.lbl.applyDropShadow()
        cell.centerLbl.isHidden = false
        cell.centerLbl.textColor = .red
        cell.centerLbl.text = "WQ_\(11 - indexPath.item )"
        cell.lbl.text = "WQ_\(11 - indexPath.item)"
        
        return cell
    }
}

extension LeadershipByCategoryVC {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets.init(top: 20, left: 20, bottom: 0, right: 20)
        }
        
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize.init(width: Constants.Screen.screenwidth * 0.20, height: 100)
        case 1:
            return CGSize.init(width: Constants.Screen.screenwidth * 0.20, height: 100)
        default:
            return CGSize.init(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            return configireDQCV(indexPath)
        case 1:
            return configureWQCV(indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height:40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
      
        if kind == UICollectionView.elementKindSectionHeader{
         
         let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier, for: indexPath) as! CustomSectionHeaderView
         
         // Configure the header based on the section
         switch indexPath.section {
         case 0:
             headerView.configure(labelText: "Daily Quiz", isButtonHidden: true )
            
         case 1:
             headerView.configure(labelText: "Weekly Quiz", isButtonHidden: true)
            
         default:
             break
         }
         
         return headerView
        
    }else{
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.reuseIdentifier, for: indexPath) as! CustomFooterView
        return footerView
        
      }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize.init(width: Constants.Screen.screenwidth , height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            pushViewController(ofType: LeadershipBoard.self)
        case 1:
            pushViewController(ofType: LeadershipBoard.self)
        default:
            print("")
        }
    }
}

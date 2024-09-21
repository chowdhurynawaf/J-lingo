//
//  ResourceTVCell.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit
import SafariServices

final class ResourceTVCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , NibLoadableView {
  
    weak var vc : HomeVC?
   
    
    
    @IBOutlet weak var hideview: UIView!
    @IBOutlet weak var downarrowview: SphereView!
    
    @IBOutlet weak var downArrowBtn: UIButton!
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var cv: UICollectionView!
    let homeresource : [Book] = [Constants.HomeResource.hiragana,Constants.HomeResource.katakana,Constants.HomeResource.kanji,Constants.HomeResource.textBook1,Constants.HomeResource.textBook2,Constants.HomeResource.textBook3,Constants.HomeResource.word1,Constants.HomeResource.word2,Constants.HomeResource.word3,Constants.HomeResource.grammar1,Constants.HomeResource.grammar2,Constants.HomeResource.grammar3,Constants.HomeResource.grammarNotes]
    let promotionArr : [Promotion] = [Constants.PromotionResource.kanji,Constants.PromotionResource.resume,Constants.PromotionResource.session,Constants.PromotionResource.skill]
    

   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setXibs()
        
    }
    
    override func prepareForReuse() {
                  
        cv.setContentOffset(CGPoint.zero, animated: false)
    }
    

    
    @IBAction func downBtnTapped(_ sender: Any) {
        
        vc?.tappedArrow()
    }
    
    fileprivate func setXibs() {
        cv.delegate = self
        cv.dataSource = self
        cv.register(RoundCVCell.self)
        cv.register(PromotionCVCell.self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch cv.tag {
        case CVTag.resource.rawValue:
            return homeresource.count
        case CVTag.promotion.rawValue:
            return promotionArr.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cv.tag {
        case CVTag.resource.rawValue:
            let cell : RoundCVCell = cv.dequeueReusableCell(for: indexPath)
            cell.lbl.text = homeresource[indexPath.item].name
            cell.img.image = UIImage(named: homeresource[indexPath.item].img)
            cell.img.contentMode = .scaleToFill
            cell.applyDropShadow()
            
            return cell
        case CVTag.promotion.rawValue:
            let cell : PromotionCVCell = cv.dequeueReusableCell(for: indexPath)
            let imgname = promotionArr[indexPath.item].img
            cell.imgView.image = UIImage(named: imgname)
            cell.applyDropShadow()
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if cv.tag == CVTag.resource.rawValue {
            return CGSize(width: Constants.Screen.screenwidth * 0.23, height: 130)
        } else if cv.tag == CVTag.promotion.rawValue {
            return CGSize(width: cv.bounds.width * 0.9, height: 150)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch cv.tag {
        case CVTag.resource.rawValue:
            let url = homeresource[indexPath.item].link
            if let vc = vc {
                SafariHelper.openURL(url, from: vc)
            }
        case CVTag.promotion.rawValue:
            let url = promotionArr[indexPath.item].link
            if let vc = vc {
                SafariHelper.openURL(url, from: vc)
            }
        default:
            print("asdf")
        }
    }
    
}


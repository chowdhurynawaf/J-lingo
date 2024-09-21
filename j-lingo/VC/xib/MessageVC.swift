//
//  MessageVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class MessageVC :  BaseCVVC , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
 
    var name : String  = ""
    var arr : [(String, String)] = Constants.Convo.conversations
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        setup()
        scrollToLastItem()
        
        
    }
    
    
    //MARK: - API
    
    
    //MARK: - Selectors
    
    //MARK: - helpers
    
    func scrollToLastItem() {
        let lastItemIndex = cv.numberOfItems(inSection: 0) - 1
        if lastItemIndex >= 0 { // Ensure there's at least one item
            let lastItemIndexPath = IndexPath(item: lastItemIndex, section: 0)
            cv.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: false)
        }
    }
    
    private func setup() {
        
        TitleLbl.text = name
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(MessageCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .fadeSlideFromBottom)
        
    }
}

extension MessageVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "MessageCVCell", for: indexPath) as! MessageCVCell
        cell.p1textView.text = arr[indexPath.row].0
        cell.p2textView.text = arr[indexPath.row].1
        cell.img.image = UIImage.init(named: "man3")
        cell.p2textView.sizeToFit()
        cell.p1textView.sizeToFit()
        cell.p1textView.isScrollEnabled = false
        cell.p2textView.isScrollEnabled = false
        
        cv.applyScrollingAnimation(to: cell, at: indexPath, with: .spin)
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        
        case 0:
            return CGSize.init(width: Constants.Screen.screenwidth , height:  150)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height:40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.reuseIdentifier, for: indexPath) as! CustomFooterView
            return footerView
            
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc  = MessageVC.init(nibName: "MessageVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
 }






//
//  CurseDetailsVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class CourseDetailsVC : BaseCVVC , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        
        setup()
    }
    
    
    private func setup() {
        
        TitleLbl.text = "Course Details"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(CourseDetailsCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .fadeSlideFromTop)
    }
    
    
    //MARK: - CollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: Constants.Screen.screenwidth, height: Constants.Screen.screenheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CourseDetailsCVCell = cv.dequeueReusableCell(for: indexPath)
        cell.vc =  self
        cell.imgView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter{
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.reuseIdentifier, for: indexPath) as! CustomFooterView
            return footerView
            
        }
        
        return UICollectionReusableView()
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)
    }
}

//
//  ForumVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class ForumVC : BaseCVVC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var arr = Constants.ForumPost.dummyPosts
    
    override func viewDidLoad() {
        
        setup()
        
    }
    
    private func setup() {
        
        TitleLbl.text = "Timeline"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(ForumCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .flipFromTop)
    }
    
}

extension ForumVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: Constants.Screen.screenwidth, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ForumCVCell = cv.dequeueReusableCell(for: indexPath)
        let data = arr[indexPath.item]
        cell.img.image = UIImage.init(named:data.imageName)
        cell.img.isHidden = false
        cell.nameLbl.text =  data.personName
        cell.whenpostedlbl.text = data.postedDay
        cell.batchlbl.text = "14th batch"
        cell.titleLbl.text = data.title
        cell.shortdescriptionLbl.text = data.description
        
        if indexPath.item % 2 == 0 {
            cell.likeBtn.setTitle("\(data.likes)", for: .normal)
            cell.likeBtn.imageView?.image = UIImage.init(systemName: "heart.fill")
            cell.commnentBtn.titleLabel?.text = "\(data.comments)"
            
            if indexPath.item == 1  {
                cell.commnentBtn.setTitle("\(data.comments)", for: .normal)
            }
            
        }else{
            cell.commnentBtn.setTitle("\(data.comments)", for: .normal)
        }
        
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
        
        return CGSize.init(width: Constants.Screen.screenwidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
         
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
    }
}

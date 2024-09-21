//
//  LeadershipBoard.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class LeadershipBoard : BaseCVVC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    let formattedArray = [

        "Md Masud Rana : (15) 5th",
        "Abdullah al Tamim : (3) 1st",
        "Azfar Shams : (8) 2nd",
        "Fazle Rabbe Bipul : (18) 6th",
        "Nafiul Alam : (12) 4th",
        "Ashraful : (7) 3rd",
        "Mashiur Rahman : (11) 7th",
        "Abir Hasan Onowy : (14) 8th",
        "Mohammad Nayem : (10) 9th",
        "NAZMUS SHADAT SHOHAN : (19) 10th",
        "Ahammed Zayed Uddin Rahat : (4) 11th",
        "MD MOBASHSHIR HOSSAIN : (13) 12th",
        "Md. Saidur Rahman Sujon : (2) 13th",
        "Nayem Mehedi : (17) 14th",
        "Rafi Hasan : (20) 15th",
        "Toufiqur Rahman : (6) 16th",
        "Pushan Paul : (9) 17th",
        "Abdul Muhaimin Adeeb : (16) 18th",
        "Sabiha Jahan : (1) 19th",
        "Naser Abdullah Alam : (5) 20th"
    ]

    
    override func viewDidLoad() {
        
        setup()
    }
    
    private func setup() {
        
        TitleLbl.text = "Leadership Board"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(LeadershipCVCell.self)
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

extension LeadershipBoard {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return formattedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "LeadershipCVCell", for: indexPath) as! LeadershipCVCell
        cell.lbl.text = formattedArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
         
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,  withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier, for: indexPath) as!   CustomSectionHeaderView
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 20, left: 20, bottom: 40, right: 20)
    }
}

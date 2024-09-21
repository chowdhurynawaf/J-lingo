//
//  ChartVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class ChartVC : BaseCVVC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    let weeklyData = [5.0, 7.0, 3.0, 8.0, 4.0, 6.0, 2.0]
    
    override func viewDidLoad() {
    
        setup()
    }
    
    private func setup() {
        
        TitleLbl.text = "Progress"
        cv.register(ChartCVCell.self)
        cv.register(githubCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.register(MonthchangerCVCell.self)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .fadeSlideFromBottom)
    }
    
    
}

extension ChartVC {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 || section == 1 {
        return 1
        }else{
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            
        if indexPath.section == 0{
            return CGSize.init(width: Constants.Screen.screenwidth, height: Constants.Screen.screenheight * 0.4)
        }
        else if indexPath.section == 1{
            return CGSize.init(width: Constants.Screen.screenwidth, height: 40)
        }
        else{
            return CGSize.init(width: 25, height: 25)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "ChartCVCell", for: indexPath) as! ChartCVCell
            return cell
        case 1:
            let cell : MonthchangerCVCell =  cv.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell : githubCell = cv.dequeueReusableCell(for: indexPath)
            cell.applyDropShadow()
            
            if indexPath.item % 2 == 0 {
                cell.githubView.backgroundColor = Constants.Colors.github2
            }else if indexPath.item == 3 {
                cell.githubView.backgroundColor = Constants.Colors.github3
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        pushViewController(ofType: AnalysisVC.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        }
        else if  section == 1{
            return UIEdgeInsets.init(top: 0, left: 20, bottom: 10, right: 20)
        }
        else {
            return UIEdgeInsets.init(top: 0, left: 20, bottom: 10, right: 20)
        }
    }
}

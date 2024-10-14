//
//  AnalysisVC.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class AnalysisVC : BaseCVVC , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let weeklyProgress: [(String, String)] = [
        ("Time Spent", "2 hours"),
        ("Daily Quiz", "15"),
        ("Average Daily Quiz", "18"),
        ("Weekly Quiz", "15"),
        ("Average Weekly Quiz", "20"),
        ("Kanji Exam", "20"),
        ("Vocabulary Practice", "45 minutes"),
        ("Grammar Review", "1 hour"),
        ("Listening Practice", "30 minutes"),
        ("Speaking Practice", "20 minutes"),
        ("Writing Practice", "25 minutes"),
        ("Kanji Learned", "25"),
        ("Vocabulary Learned", "50"),
        ("Grammar Points Covered", "10"),
        ("Listening Exercises", "5"),
        ("Speaking Exercises", "4"),
        ("Writing Exercises", "3"),
        ("Suggested Improvement", "Focus more on speaking")
    ]

    
    override func viewDidLoad() {
        
        setup()
    }
    
    private func setup() {
        TitleLbl.text = "Analysis"
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(AnalysisCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        menuBtn.tintColor = .white
        backBtn.tintColor = .white
        
        cv.animateSection(0, with: .slideInFromTop)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return weeklyProgress.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        if indexPath.item == weeklyProgress.count - 1{
//            return CGSize.init(width: Constants.Screen.screenwidth, height: 100)
//        }
        return CGSize.init(width: Constants.Screen.screenwidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : AnalysisCVCell = cv.dequeueReusableCell(for: indexPath)
        let data = weeklyProgress[indexPath.item]
        cell.title.text = data.0
        cell.valueLbl.text = data.1
        return cell
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 20, right: 0)
    }
}

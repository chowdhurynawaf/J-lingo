//
//  GameVC.swift
//  j-lingo
//
//  Created by as on 8/11/24.
//

import UIKit

final class GameVC: BaseCVVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var dataArr : [Book] = Constants.Practice.arr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    private func setup() {
        
        self.TitleLbl.text = "Games"
        self.TitleLbl.isHidden = false
        
        cv.register(WQCVCell.self)
        cv.delegate = self
        cv.dataSource = self
        
        cv.animateSection(0, with: .fadeSlideFromTop)
    }
    

    
}

//MARK: - collectionview

extension GameVC {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr .count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: indexPath) as! WQCVCell
        let data = dataArr[indexPath.item]
        cell.centerLbl.isHidden = true
        cell.img.contentMode = .scaleToFill
        cell.lbl.text = data.name
        cell.img.image = UIImage(named: data.img)
        cell.applyDropShadow()
        cv.applyScrollingAnimation(to: cell, at: indexPath, with: .scaleUp)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth * 0.42, height: Constants.Screen.screenwidth * 0.42 + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        switch indexPath.item {
        case 0:
            print("")
            let aivc = AIVC(nibName: "AIVC", bundle: nil)
            self.navigationController?.pushViewController(aivc, animated: true)
            break
        case 1:
            let vc = PracticeVC(nibName: "PracticeVC", bundle: nil)
            vc.flag = PracticeFlag.hiragana.rawValue
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = PracticeVC(nibName: "PracticeVC", bundle: nil)
            vc.flag = PracticeFlag.katakana.rawValue
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            pushWithData(ofType: OptionsVC.self){ vc in
                vc.img = "furigana"
                vc.arr = Constants.Practice.furiganaArr
                vc.flag = PracticeFlag.kanji.rawValue
            }
            break
        case 4:
            pushWithData(ofType: OptionsVC.self) {vc in
                let arr : [String] = ["noun", "verb", "adverb", "adjective", "conjunction","sixthousand"]
                vc.imgArr = arr 
                vc.arr = Constants.Practice.VocabArr
                vc.flag = PracticeFlag.vocabs.rawValue
            }
        case 5:
            pushWithData(ofType: MCQVC.self){vc in
                vc.dic = Constants.Practice.grammarTerms
            }
        case 6:
            pushWithData(ofType: PracticeVC.self) { vc in
                vc.flag = PracticeFlag.wh.rawValue
            }
        case 7:
            pushWithData(ofType: MCQVC.self){vc in
                vc.dic = Constants.Practice.softwareQuestions
            }
        case 8:
            pushWithData(ofType: MCQVC.self){vc in
                vc.dic = Constants.Practice.confusionList
            }
            
        case 9:
            pushWithData(ofType: MCQVC.self){vc in
                
                vc.dic = Constants.Practice.flagDic
                vc.flag = "flagBtnHidden"
                
            }
            
        default:
            print("")
        }
    }
}

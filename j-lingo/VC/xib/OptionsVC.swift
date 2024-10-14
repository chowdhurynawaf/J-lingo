//
//  OptionsVC.swift
//  j-lingo
//
//  Created by Macbook Pro on 10/12/24.
//

import UIKit

final class OptionsVC :  BaseCVVC  {
    
    var arr : [Book] = [] {
        didSet {
            
        }
    }
    var img : String = ""
    var imgArr : [String] = []
    var flag : Int?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

    }
    
    fileprivate func setup() {
        
        self.cv.collectionViewLayout = createColumnFlowLayout(cellsPerRow: 2,minimumInteritemSpacing: 15)
        self.TitleLbl.text = "Category"
        self.TitleLbl.isHidden = false
        self.backBtn.isHidden = false
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(QuizCVCell.self)
    }
    
    fileprivate func configireOptionsCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "QuizCVCell", for: indexPath) as! QuizCVCell
        
        let obj = arr[indexPath.item]
        
        if imgArr.count < 1 {
            cell.imgview.image = UIImage(named: img)
        }else {
            cell.imgview.image = UIImage(named: imgArr[indexPath.item])
        }
        cell.imgview.isHidden = false
        cell.centerLbl.font = UIFont.init(name: Constants.Font.poppins_bold, size: 15)
        cell.shapedView.layer.cornerRadius = 15
        cell.shapedView.layer.borderColor = UIColor.black.cgColor
        cell.shapedView.layer.borderWidth = 0.3
        cell.imgview.contentMode = .scaleAspectFill
        cell.imgview.applyDropShadow()
        cell.centerLbl.applyDropShadow()
        cell.titleLbl.applyDropShadow()
        cell.centerLbl.setAngle(-50)
        cell.centerLbl.text = obj.name
        cell.titleLbl.text = obj.name
        
        if(flag == PracticeFlag.vocabs.rawValue){
            cell.centerLbl.isHidden = true
        }
        
        return cell
    }
    
}

extension OptionsVC : UICollectionViewDelegate, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return configireOptionsCell(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
        switch flag {
            
        case PracticeFlag.vocabs.rawValue:
            switch indexPath.item {
            case 0:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.nounDic
                }
            case 1:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.verbdic
                }
            case 2:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.adverbdic
                }
            case 3:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.adjectivedic
                }
            case 4:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.conjunctiondic
                }
            case 5:
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.sixthousandDic
                }
            default:
                print("")
            }
        case PracticeFlag.kanji.rawValue:
            if indexPath.item == 0 {
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.englishToKanji
                }
            }else if indexPath.item == 1 {
                pushWithData(ofType: MCQVC.self){vc in
                    vc.dic = Constants.Practice.furiganaToKanjiTupleList
                }
            }else if indexPath.item == 2 {
                pushWithData(ofType: MCQVC.self){ vc in
                    vc.dic = Constants.Practice.compoundKanji
                }
            }else if indexPath.item == 3 {
                pushWithData(ofType: MCQVC.self){ vc in
                    vc.dic = Constants.Practice.wanikaniDic
                }
            }
        case .none:
            print("")
        case .some(_):
            print("")
        }
    }
}




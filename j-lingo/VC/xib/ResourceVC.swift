//
//  ResourceVC.swift
//  j-lingo
//
//  Created by as on 8/12/24.
//

import UIKit

final class ResourceVC:  BaseCVVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var dataArr1 : [Book] = Constants.HomeResource.term1Arr
    var dataArr2 : [Book] = Constants.HomeResource.term2Arr
    var dataArr3 : [Book] = Constants.HomeResource.term3Arr
    var dataArr4 : [Book] = Constants.HomeResource.pptxArr
    
    let resourcepdfArr : [String] = [
        
        Constants.PDFFlags.hiragana,
        Constants.PDFFlags.katakana,
        Constants.PDFFlags.kanji,
        "",
        Constants.PDFFlags.wx,
        Constants.PDFFlags.gx,
        
    ]
    
    let resourcepdfArr2 : [String] = [
        
        
        "",
        Constants.PDFFlags.wy,
        Constants.PDFFlags.gy,
        
    ]
    
    let resourcepdfArr3 : [String] = [
        
        "",
        Constants.PDFFlags.wz,
        Constants.PDFFlags.gz,
        
    ]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        
    }
    
    private func setup() {
          
          self.TitleLbl.text = "Resources"
          self.TitleLbl.isHidden = false
          self.backBtn.isHidden = false
          cv.register(WQCVCell.self)
          cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        
          cv.delegate = self
          cv.dataSource = self
        
        cv.animateSection(0, with: .slideInFromBottom)
        cv.animateSection(1, with: .slideInFromTop)
        cv.animateSection(2, with: .zoomInBounce)
        cv.animateSection(3, with: .fadeIn)
      }
  }

//MARK: - collectionview

extension ResourceVC {
    
    
    private func configureCell(_ items:[Book], idx:IndexPath) -> UICollectionViewCell{
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: idx) as! WQCVCell
        let data = items[idx.item]
        cell.centerLbl.isHidden = true
        cell.img.contentMode = .scaleToFill
        cell.lbl.text = data.name
        cell.img.image = UIImage(named: data.img)
        cell.applyDropShadow()
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dataArr1.count
        case 1:
            return dataArr2.count
        case 2:
            return dataArr3.count
        case 3:
            return dataArr4.count
        default:
            print("")
    }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            return configureCell(dataArr1,idx: indexPath)
        case 1:
            return configureCell(dataArr2,idx: indexPath)
        case 2:
            return configureCell(dataArr3, idx: indexPath)
        case 3:
            return configureCell(dataArr4, idx: indexPath)
        default:
            print("")
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 3 {
            
            return CGSize.init(width: Constants.Screen.screenwidth * 0.43, height: 170)
        }
        return CGSize.init(width: Constants.Screen.screenwidth * 0.20, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        default:
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
         
         let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier, for: indexPath) as! CustomSectionHeaderView
         
         // Configure the header based on the section
         switch indexPath.section {
         case 0:
             headerView.configure(labelText: "Term 1", isButtonHidden: true)
            
         case 1:
             headerView.configure(labelText: "Term 2", isButtonHidden: true)
             
         case 2:
             headerView.configure(labelText: "Term 3", isButtonHidden: true)
         case 3:
             headerView.configure(labelText: "Powerpoint Slides", isButtonHidden: true)
            
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
        return CGSize(width: collectionView.bounds.width, height: 40) // Adjust the height as needed
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            
            if section == 3{
            return CGSize(width: collectionView.bounds.width, height: 40)
            }
            
            return   CGSize(width: collectionView.bounds.width, height: 0)
        }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            if(indexPath.item == 3){
                let data = dataArr1[indexPath.item]
                SafariHelper.openURL(data.link, from: self)
            }else{
                
                self.pushWithData(ofType: PDFVC.self){ vc in
                    vc.flag = self.resourcepdfArr[indexPath.item]
                }
            }
        case 1:
            if(indexPath.item == 0){
                let data = dataArr2[indexPath.item]
                SafariHelper.openURL(data.link, from: self)
            }else {
                
                self.pushWithData(ofType: PDFVC.self){ vc in
                    vc.flag = self.resourcepdfArr2[indexPath.item]
                }
            }
        case 2:
            if(indexPath.item == 0 || indexPath.item == 3){
                let data = dataArr3[indexPath.item]
                SafariHelper.openURL(data.link, from: self)
            }else{
                
                self.pushWithData(ofType: PDFVC.self){ vc in
                    vc.flag = self.resourcepdfArr3[indexPath.item]
                }
            }
        case 3:
            let data = dataArr4[indexPath.item]
            SafariHelper.openURL(data.link, from: self)
        
        default:
            print("")
        }
    }
}

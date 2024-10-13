//
//  MyLearningVC.swift
//  j-lingo
//
//  Created by as on 8/11/24.
//

import UIKit


final class MyLearningVC:  BaseCVVC, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var dataArr : [Course] = [Constants.Courses.c1,Constants.Courses.c2,Constants.Courses.c3,Constants.Courses.c4,Constants.Courses.c5,Constants.Courses.c6,Constants.Courses.c7,Constants.Courses.c8]
    var fromEnroll:Bool?
    var percentageArr : [Int] = [0,0,95,20,34,20,0,80]

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
           self.TitleLbl.text = "My Learning"
           self.TitleLbl.isHidden = false
           
           cv.register(MyLearningCVCell.self)
           cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)

           cv.delegate = self
           cv.dataSource = self
        
        if let fromEnroll = fromEnroll {
            if fromEnroll == true {
                backBtn.isHidden = false
                backBtn.tintColor = .white
            }
        }
    }
}


extension MyLearningVC {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataArr .count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = cv.dequeueReusableCell(withReuseIdentifier: "MyLearningCVCell", for: indexPath) as! MyLearningCVCell
    let data = dataArr[indexPath.item]
    
    
    cell.imgView.setLocalImage(named: "\(data.img)")
    cell.imgView.contentMode = .scaleToFill
    cell.ContentTitle.text = data.title
    cell.nameLbl.text = data.name
    
    cv.applyScrollingAnimation(to: cell, at: indexPath, with: .squeezeOut)
    
//    if indexPath.item % 2 == 0{
//
//        cell.percentageHolderView.isHidden = false
//        let percentage = Int.random(in: 1...100)
//        cell.percentageView.fillWithColor(Constants.Colors.appcolor, percentage: CGFloat(percentage) / 100.0,isHorizontal: true)
//        cell.percentageLbl.text = "\(percentage)%"
//        cell.btnView.isHidden = true
//
//
//    }else if indexPath.item % 3 == 0{
//        cell.percentageHolderView.isHidden = true
//        cell.btnView.isHidden = false
//    }else{
//        cell.percentageHolderView.isHidden = true
//        cell.btnView.isHidden = false
//    }
    
    let percentage = percentageArr[indexPath.item]
    
    if percentage == 0 {
        cell.percentageHolderView.isHidden = true
        cell.btnView.isHidden = false
    }else{
        
        cell.percentageHolderView.isHidden = false
        cell.percentageLbl.text = "\(percentage)%"
        cell.percentageView.fillWithColor(Constants.Colors.appcolor, percentage: CGFloat(percentage) / 100.0,isHorizontal: true)
        cell.btnView.isHidden = true
    }
    
    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize.init(width: Constants.Screen.screenwidth, height: 140)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
}
    
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
    switch kind {
    case UICollectionView.elementKindSectionHeader:
        print("")
    case UICollectionView.elementKindSectionFooter:
        
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.reuseIdentifier, for: indexPath) as! CustomFooterView
        return footerView

    default:
        print("")
    }
        return UICollectionReusableView()
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: Constants.Screen.screenwidth, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        pushViewController(ofType: EnrolledCourseVC.self)
        
    }
}

//
//  CmnTVCell.swift
//  j-lingo
//
//  Created by as on 8/8/24.
//

import UIKit

final class CmnTVCell: UITableViewCell,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , NibLoadableView {
    
    
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var cv: UICollectionView!
    
    weak var vc : HomeVC?
    
    var coursearr : [Course] = [Constants.Courses.c1,Constants.Courses.c2,Constants.Courses.c3,Constants.Courses.c4,Constants.Courses.c5,Constants.Courses.c6,Constants.Courses.c7,Constants.Courses.c8]
    var dateArr : [String] = ["12-04-24", "13-04-24", "14-04-24" , "15-04-24" ,"16-04-24","17-04-24"]
    var testArr : [String] = ["A1_X1", "A2_X1","A3_X1","A4_X1","A5_X1","A6_X1","A7_X1",]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cv.delegate = self
        cv.dataSource = self
        cv.register(QuizCVCell.self)
        cv.register(RoundCVCell.self)
        cv.register(CourseCVCell.self)
        cv.register(WQCVCell.self)
    }
    
    override func prepareForReuse() {
        
        cv.setContentOffset(CGPoint.zero, animated: false)
    }

    
    

    
    fileprivate func configireDQCV(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "QuizCVCell", for: indexPath) as! QuizCVCell
        
        cell.imgview.image = UIImage(named: "DQ")
        cell.imgview.isHidden = false
        cell.centerLbl.font = UIFont.init(name: Constants.Font.poppins_bold, size: 20)
        cell.shapedView.layer.cornerRadius = 15
        cell.imgview.contentMode = .scaleAspectFill
        cell.imgview.applyDropShadow()
        cell.centerLbl.applyDropShadow()
        cell.titleLbl.applyDropShadow()
        cell.centerLbl.setAngle(-50)
        cell.centerLbl.text = "DQ_\(7 - indexPath.item )"
        cell.titleLbl.text = "DQ_\(7 - indexPath.item)"
        
        return cell
    }
    
    fileprivate func configureWQCV(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: indexPath) as! WQCVCell
        
        cell.img.image = UIImage()
        cell.centerLbl.text = ""
        cell.lbl.text = ""
        
        cell.parentHolderView.borderColor = .separator
        cell.parentHolderView.borderWidth = 2
        cell.parentHolderView.layer.cornerRadius = 40
        cell.centerLbl.font = UIFont.init(name: Constants.Font.poppins_bold, size: 17)
        cell.lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 20)
        cell.centerLbl.applyDropShadow()
        cell.img.image = UIImage(named: "WQ")
        cell.img.contentMode = .scaleAspectFill
        cell.centerLbl.setAngle(-50)
        cell.lbl.applyDropShadow()
        cell.centerLbl.isHidden = false
        cell.centerLbl.textColor = .red
        cell.centerLbl.text = "WQ_\(7 - indexPath.item )"
        cell.lbl.text = "WQ_\(7 - indexPath.item)"
        
        return cell
    }
    
    fileprivate func configureCoursesCV(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "CourseCVCell", for: indexPath) as! CourseCVCell
        
        cell.imgView.image = UIImage()
        cell.titleLbl.text = ""
        cell.namelbl.text = ""
        
        cell.imgView.contentMode = .scaleToFill
        cell.parentHolderView.applyDropShadow()
        cell.cosmos.settings.fillMode = .half
        let course = coursearr[indexPath.item]
        cell.titleLbl.text = course.title
        cell.namelbl.text = course.name
        
        switch indexPath.item {
        case 0:
            cell.imgView.image = UIImage.init(named: "t2")
        case 1:
            cell.imgView.image = UIImage.init(named: "t1")
        case 2:
            cell.imgView.image = UIImage.init(named: "t3")
        case 3:
            cell.imgView.image = UIImage.init(named: "t4")
        default:
            print("")
        }
        return cell
    }
    
    fileprivate func configureBooks(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "RoundCVCell", for: indexPath) as! RoundCVCell
        
        cell.img.layer.cornerRadius = 10
        cell.centerLbl.isHidden = true
        cell.lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 15)
        
        switch indexPath.item {
        case 0:
            cell.img.image = UIImage(named: "mn")
            cell.lbl.text = "Mina no Nihongo"
        case 1:
            cell.img.image = UIImage(named: "genki1")
            cell.lbl.text = "Genki 1"
        case 2:
            cell.img.image = UIImage(named: "genki2")
            cell.lbl.text = "Genki 2"
        default:
            print("")
        }
        
        cell.img.contentMode = .scaleToFill
        cell.applyDropShadow()
        
        return cell
    }
    
    //MARK: - collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch cv.tag {
        case CVTag.DQ.rawValue:
          return 7
        case CVTag.WQ.rawValue:
            return 7
        case CVTag.Courses.rawValue:
            return 4
        case CVTag.Books.rawValue:
            return 3
        case CVTag.OClass.rawValue :
            return 6
        case CVTag.Pt.rawValue:
            return 6
        default:
            return 0
        }
    }
    
    fileprivate func configureOnlineClass(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: indexPath) as! WQCVCell
        
        cell.parentHolderView.borderColor = .separator
        cell.parentHolderView.borderWidth = 2
        cell.parentHolderView.layer.cornerRadius = 10
        cell.lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 15)
        cell.img.contentMode = .scaleAspectFill
        cell.lbl.applyDropShadow()
        cell.centerLbl.isHidden = true
        cell.lbl.text = dateArr[indexPath.item]
        
        if indexPath.item % 2 == 0 {
            cell.img.image = UIImage(named: "z1")
            
        }else if indexPath.item % 3  == 0 {
            cell.img.image = UIImage(named: "z2")
        }else {
            cell.img.image = UIImage(named: "z3")
        }
        
        return cell
    }
    
    fileprivate func configurePt(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "WQCVCell", for: indexPath) as! WQCVCell
        
        cell.parentHolderView.borderColor = .black
        cell.parentHolderView.borderWidth = 0.3
        cell.parentHolderView.layer.cornerRadius = 10
        cell.lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 15)
        cell.img.contentMode = .scaleAspectFill
        cell.lbl.applyDropShadow()
        cell.centerLbl.isHidden = true
        cell.lbl.text = testArr[indexPath.item]
        
        if indexPath.item % 2 == 0 {
            cell.img.image = UIImage(named: "st1")
            
        }else if indexPath.item % 3  == 0 {
            cell.img.image = UIImage(named: "st2")
        }else {
            cell.img.image = UIImage(named: "st3")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cv.tag {
        case CVTag.DQ.rawValue:
            return configireDQCV(indexPath)
        case CVTag.WQ.rawValue:
            return configureWQCV(indexPath)
        case CVTag.Courses.rawValue:
            return configureCoursesCV(indexPath)
        case CVTag.Books.rawValue:
            return configureBooks(indexPath)
        case CVTag.OClass.rawValue :
            return configureOnlineClass(indexPath)
        case CVTag.Pt.rawValue :
            return configurePt(indexPath)
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch cv.tag {
        case CVTag.DQ.rawValue:
            return CGSize(width: Constants.Screen.screenwidth * 0.25, height: 100)
        case CVTag.WQ.rawValue:
            return CGSize(width: Constants.Screen.screenwidth * 0.25, height: 120)
        case CVTag.Courses.rawValue:
            return CGSize(width: Constants.Screen.screenwidth * 0.75, height: 290)
        case CVTag.Books.rawValue:
            return CGSize(width: Constants.Screen.screenwidth * 0.25, height: 120)
        case CVTag.OClass.rawValue :
            return CGSize(width: Constants.Screen.screenwidth * 0.75, height: 190)
        case CVTag.Pt.rawValue :
            return CGSize(width: Constants.Screen.screenwidth * 0.50, height: 145)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch cv.tag {
        case CVTag.DQ.rawValue:
            return 10
        case CVTag.WQ.rawValue:
            return 20
        case CVTag.Courses.rawValue:
            return 10
        case CVTag.OClass.rawValue:
            return 10
        case CVTag.Pt.rawValue:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       
        switch cv.tag {
        case CVTag.OClass.rawValue , CVTag.DQ.rawValue,CVTag.WQ.rawValue , CVTag.Courses.rawValue , CVTag.Pt.rawValue :
            return 10
        default:
            return  0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch cv.tag {
        case CVTag.DQ.rawValue:
            if let vc = vc {
                SafariHelper.openURL("https://docs.google.com/forms/d/e/1FAIpQLScko4-tjofaD38vIDd84wqZg21EkF8ead0wXvYkaHju_uV9Pw/viewform?hr_submission=ChkI7bnB-pkUEhAI8PqY9b8TEgcI3fiY9b8TEAE", from: vc)
            }
        case CVTag.WQ.rawValue:
            if let vc = vc {
                SafariHelper.openURL("https://docs.google.com/forms/d/e/1FAIpQLSfuKXikJnOerrZIwdzPa3liMGxlJVWjvz5hVAlvUub50k34sA/viewform?hr_submission=ChkI7bnB-pkUEhAI9fqY9b8TEgcI3fiY9b8TEAE", from: vc)
            }
        case CVTag.Books.rawValue :
            if let vc = vc {
                SafariHelper.openURL("https://www.mountheadoverseas.com/wp-content/uploads/2024/08/Final-Books-for-Japan-language-PDF.docx.pdf?", from: vc)
            }
        case CVTag.OClass.rawValue:
            if let vc = vc {
                SafariHelper.openURL("https://www.youtube.com/watch?v=U2wHYG7TOJ0", from: vc)
            }
            
        case CVTag.Courses.rawValue:
            if let vc = vc {
                vc.pushViewController(ofType: CourseDetailsVC.self)
            }
        case CVTag.Pt.rawValue:
            if let vc = vc {
                SafariHelper.openURL("https://docs.google.com/forms/d/e/1FAIpQLSc0lxhLKESqRpaU4l1u1L7b6avXXbaQwgcDA0_kW78LhkK9Zw/viewform?hr_submission=ChkI7bnB-pkUEhAIgPuY9b8TEgcI3fiY9b8TEAA", from: vc)
            }
        default:
            print("asdf")
        }
    }
    
}

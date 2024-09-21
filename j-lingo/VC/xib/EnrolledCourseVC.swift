//
//  EnrolledCourseVC.swift
//  j-lingo
//
//  Created by as on 8/16/24.
//

import UIKit

final class EnrolledCourseVC : BaseCVVC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var currentplaying = ""
    let arr: [(String, String)] = [
        ("https://www.youtube.com/embed/pFSow1SYsqE", "Introduction to Japanese Writing"),
        ("https://www.youtube.com/embed/pFSow1SYsqE", "Learn Japanese in 4 Hours"),
        ("https://www.youtube.com/embed/hN3FG1NFJS0", "Japanese Listening Practice for Beginners"),
        ("https://www.youtube.com/embed/RF0TMh9EfE4", "How to Write Hiragana"),
        ("https://www.youtube.com/embed/ac1f8qa30Bg", "Learn Japanese with Anime"),
        ("https://www.youtube.com/embed/x6jP8nCcHDo", "200 Common Japanese Words"),
        ("https://www.youtube.com/embed/6p9Il_j0zjc", "Learn Japanese While Sleeping"),
        ("https://www.youtube.com/embed/xKjoYw4rRZ4", "Top 100 Japanese Adjectives"),
        ("https://www.youtube.com/embed/BPntZ-Ysi20", "Japanese Grammar for Beginners"),
        ("https://www.youtube.com/embed/gBYiVns2SkU", "Essential Japanese Vocabulary"),
        ("https://www.youtube.com/embed/zR7GRmOOZoA", "Top 25 Japanese Phrases"),
        ("https://www.youtube.com/embed/6Bq1ZyY4GDw", "Common Japanese Greetings"),
        ("https://www.youtube.com/embed/dM2ooz6hYxI", "Japanese Verb Conjugation"),
        ("https://www.youtube.com/embed/KoL-q3qpQgc", "Japanese Particles for Beginners"),
        ("https://www.youtube.com/embed/3kHJjXOzsoQ", "Japanese Vocabulary for Daily Life"),
        ("https://www.youtube.com/embed/EvT5XSrYsBM", "How to Count in Japanese"),
        ("https://www.youtube.com/embed/nc3dVDXrWFA", "Basic Japanese Conversation"),
        ("https://www.youtube.com/embed/Ho7gZIoYPpM", "Mastering Japanese Pronunciation"),
        ("https://www.youtube.com/embed/--vBVK_aB3E", "Japanese Listening Practice for N5"),
        ("https://www.youtube.com/embed/gPiYo7nvKfA", "Japanese Numbers 1 to 100"),
        ("https://www.youtube.com/embed/WiHRdmC-j6c", "Japanese Kanji for Beginners"),
        ("https://www.youtube.com/embed/ybZUm5dpD1w", "How to Speak Japanese Fluently"),
        ("https://www.youtube.com/embed/pI0bKrI1LuA", "Japanese Honorifics Explained"),
        ("https://www.youtube.com/embed/jtOfWvXSPIw", "Top 10 Japanese Foods"),
        ("https://www.youtube.com/embed/CKo-vfs1X4k", "Essential Japanese Phrases for Travel"),
        ("https://www.youtube.com/embed/pW5pK6ZyDr0", "Learn Japanese with Music"),
        ("https://www.youtube.com/embed/yPKCvqP5jeY", "Mastering Japanese Sentence Structure"),
        ("https://www.youtube.com/embed/gVAA9H7VxDg", "Japanese Verbs You Should Know"),
        ("https://www.youtube.com/embed/-d-uwNPl1Vw", "How to Introduce Yourself in Japanese"),
        ("https://www.youtube.com/embed/jIRYKB61_84", "Top 100 Japanese Nouns")
    ]

    
    
    override func viewDidLoad() {
        
        setup()
    }
    
    private func setup() {
        
        
        currentplaying = arr[0].0
        TitleLbl.text = "Video"
        
        cv.register(CustomSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        cv.register(EmbededVideoCVCell.self)
        cv.register(CourseoptionsCVCell.self)
        cv.register(ContentListCVCell.self)
        cv.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        
        menuBtn.isHidden = true
        backBtn.isHidden = false
        backBtn.tintColor = .white
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
           return 1
        case 1:
            return 1
        case 2:
            return arr.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize.init(width: Constants.Screen.screenwidth, height: Constants.Screen.screenheight * 0.35)
        case 1:
            return CGSize.init(width: Constants.Screen.screenwidth, height: 50)
        case 2:
            return CGSize.init(width: Constants.Screen.screenwidth, height: 40)
        default:
            return CGSize.init(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell : EmbededVideoCVCell = cv.dequeueReusableCell(for: indexPath)
            cell.configure(with: currentplaying)
            return cell
        case 1:
            let cell : CourseoptionsCVCell = cv.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell : ContentListCVCell = cv.dequeueReusableCell(for: indexPath)
            cell.lbl.text = arr[indexPath.item].1
            return cell
        default:
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.reuseIdentifier, for: indexPath) as! CustomFooterView
            return footerView
            
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 2 {
            return CGSize.init(width: Constants.Screen.screenwidth, height: 40)
        }
        
        return CGSize.init(width: Constants.Screen.screenwidth, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 2{
            
            let data = arr[indexPath.item]
            let cell =  collectionView.cellForItem(at: IndexPath(item: 0, section: 0),as: EmbededVideoCVCell.self)
            currentplaying = data.0
            cell?.configure(with: data.0)
            cv.reloadItems(at: [IndexPath(item: 0, section: 0)])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)
    }
}

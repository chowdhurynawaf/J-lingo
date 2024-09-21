//
//  AIVC.swift
//  j-lingo
//
//  Created by as on 8/26/24.
//

import UIKit

class AIVC: UIViewController {
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var cv: UICollectionView!
    
    
    let data: [AIModel] = [
        AIModel(role: .user, message: "What is the best way to learn Japanese?\n"),
        AIModel(role: .ai, message: "One effective way to learn Japanese is to practice regularly with native speakers, use language learning apps, and immerse yourself in Japanese media."),
        AIModel(role: .user, message: "Can you recommend some apps?\n"),
        AIModel(role: .ai, message: "Sure! Some popular Japanese learning apps include Duolingo, Rosetta Stone, and Memrise.\n"),
        AIModel(role: .user, message: "What are some common Japanese phrases for beginners?\n"),
        AIModel(role: .ai, message: "Common phrases for beginners include 'こんにちは' (Konnichiwa) for 'Hello,' 'ありがとう' (Arigatou) for 'Thank you,' and 'すみません' (Sumimasen) for 'Excuse me.'"),
        AIModel(role: .user, message: "How can I practice speaking Japanese if I don't have anyone to speak with?"),
        AIModel(role: .ai, message: "You can practice speaking Japanese by using language exchange apps, recording yourself speaking, or using speech recognition features in language learning apps."),
        AIModel(role: .user, message: "What is godan verb\n.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
    }
    
    private func setUp() {
        
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
        cv.register(AICVCell.self)
        cv.register(UserChatCVCell.self)
        
        cv.delegate = self
        cv.dataSource = self
        
        cv.layoutIfNeeded()
        
        cv.animateSection(0, with: .scaleUp)

    }
    
    @IBAction func tappedBackBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func heightForTextView(withText text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        textView.font = font
        textView.text = text
        textView.sizeToFit()
        return textView.contentSize.height
    }
    
}

extension AIVC : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
 

    // Example usage in a UICollectionViewDelegateFlowLayout method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenWidth = UIScreen.main.bounds.width
               let textViewWidth = screenWidth * 0.4
        let sampleText = data[indexPath.item].message
        let font = UIFont.init(name: Constants.Font.poppins_bold, size: 14.5)
        let textViewHeight = heightForTextView(withText: sampleText, font: font!, width: textViewWidth)
        return CGSize(width: Constants.Screen.screenwidth, height: textViewHeight)
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item % 2 == 0 {
            
            let cell : UserChatCVCell = cv.dequeueReusableCell(for: indexPath)
            cell.txtview.text = data[indexPath.item].message
            cell.txtview.sizeToFit()
            cv.applyScrollingAnimation(to: cell, at: indexPath, with: .scaleUp)
            return cell
            
        }else {
            let cell : AICVCell = cv.dequeueReusableCell(for: indexPath)
           
            cell.txtview.text = data[indexPath.item].message
            cell.txtview.sizeToFit()

            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 20, left: 5, bottom: 20, right: 5)
        
      }
    }


struct AIModel {
    let role: AIRole
    let message: String
}

enum AIRole: String {
    case user = "User"
    case ai = "AI"
}

//
//  SignOUtCVCell.swift
//  j-lingo
//
//  Created by as on 8/13/24.
//

import UIKit

final class SignOUtCVCell: UICollectionViewCell , NibLoadableView {
    @IBOutlet weak var signoutBtn: UIButton!
    weak var vc : UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tappedSignOutBtn(_ sender: Any) {
        
       let u = UserDefaultsHelper()
        u.saveString(data: "")
        
        
        if let vc = vc {
            let emailvc = EmailLoginVC(nibName: "EmailLoginVC", bundle: nil)
            emailvc.modalPresentationStyle = .fullScreen
            vc.navigationController!.present(emailvc, animated: true)
        }
    }
    
}

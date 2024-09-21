//
//  CVCellWithButton.swift
//  j-lingo
//
//  Created by as on 8/13/24.
//

import UIKit

final class CVCellWithButton: UICollectionViewCell ,  NibLoadableView {
    
    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var settingsBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedSettingsBtn(_ sender: Any) {
    }
    

}
